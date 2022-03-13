import 'package:quran_widget_flutter/data_source/data_source.dart';
import 'package:quran_widget_flutter/data_source/local/local_data_source/chapter_local_data_source.dart.dart';
import 'package:quran_widget_flutter/data_source/remote/chapter_api.dart';
import 'package:quran_widget_flutter/model/apis_response/my_response.dart';
import 'package:quran_widget_flutter/model/chapter.dart';
import 'package:quran_widget_flutter/network_helper/apis.dart';

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
      if (fromIndex ?? false) {
        for (var element in chaptersList) {
          if (element.pageFrom == null &&
              element.pageTo == null &&
              element.versesSize == null) {
            var pages = await DataSource.instance.fetchPagesList(
                bookId: bookId,
                narrationId: narrationId,
                chapterId: element.id);
            element.pageFrom = pages![0].pageNumber ?? 1;
            element.pageTo = pages[pages.length - 1].pageNumber ?? 1;

            int size = 0;

            for (var element in pages) {
              size += element.verses!.length;
            }

            element.versesSize = size;
            _chapterLocalDataSource.saveChapter(element);
          }
        }
      }

      return chaptersList;
    } else {
      final MyResponse<Chapter> response =
          await _chapterApi.fetchChaptersList();
      if (response.code == Apis.codeSUCCESS) {
        chaptersList = response.data as List<Chapter>;
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
