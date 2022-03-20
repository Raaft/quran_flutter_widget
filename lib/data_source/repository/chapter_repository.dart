import 'package:quran_widget_flutter/data_source/local/local_data_source/chapter_local_data_source.dart.dart';
import 'package:quran_widget_flutter/data_source/remote/chapter_api.dart';
import 'package:quran_widget_flutter/model/apis_response/my_response.dart';
import 'package:quran_widget_flutter/network_helper/apis.dart';
import 'package:quran_widget_flutter/quran_widget_flutter.dart';

class ChapterRepository {
  final ChapterLocalDataSource _chapterLocalDataSource =
      ChapterLocalDataSource();
  final ChapterApi _chapterApi = ChapterApi();

  Future<List<Chapter>?> fetchChaptersList({
    String? qurey,
    bool? fromIndex,
    int? bookId,
    int? narrationId,
  }) async {
    List<Chapter>? chaptersList = (qurey != null && qurey.isNotEmpty)
        ? await _chapterLocalDataSource.searchInChapter(qurey: qurey)
        : await _chapterLocalDataSource.fetchChaptersList();

    if ((chaptersList != null && chaptersList.isNotEmpty)) {
      return chaptersList;
    } else {
      final MyResponse<Chapter> response =
          await _chapterApi.fetchChaptersList();
      if (response.code == Apis.codeSUCCESS) {
        chaptersList = response.data as List<Chapter>;

        for (int i = 0; i < chaptersList.length; i++) {
          List<Page>? pages = await DataSource.instance.fetchPagesList(
                bookId: bookId,
                narrationId: narrationId,
                chapterId: chaptersList[i].id,
              ) ??
              [];

          List<int> containedPages = [];
          for (var page in pages) {
            for (var element in page.chapters!) {
              if (element.chapterId == chaptersList[i].id) {
                containedPages.add(page.pageNumber ?? 0);
                break;
              }
            }
          }
          if (containedPages.isNotEmpty) {
            if (containedPages.length == 1) {
              chaptersList[i].pageFrom = containedPages[0];
              chaptersList[i].pageTo = containedPages[0];
            }
            chaptersList[i].pageFrom = containedPages[0];
            chaptersList[i].pageTo = containedPages[containedPages.length - 1];
          }
          int size = 0;

          for (var page in pages) {
            for (var verse in page.verses!) {
              if (verse.chapterId == chaptersList[i].id) {
                size++;
              }
            }
          }

          chaptersList[i].versesSize = size;
        }
        _chapterLocalDataSource.saveChaptersList(chaptersList);
      }
      return chaptersList;
    }
  }

  Future<Chapter?> fetchChapterById(int chapterId) async {
    Chapter? chapter =
        await _chapterLocalDataSource.fetchChapterById(chapterId);
    if (chapter != null) {
      return chapter;
    } else {
      final MyResponse<Chapter> response =
          await _chapterApi.fetchChapterById(chapterId);
      if (response.code == Apis.codeSUCCESS) {
        chapter = response.data as Chapter?;
      }
      return chapter;
    }
  }
}
