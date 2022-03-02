import 'package:quran_widget_flutter/data_source/local/local_data_source/chapter_local_data_source.dart.dart';
import 'package:quran_widget_flutter/data_source/remote/chapter_api.dart';
import 'package:quran_widget_flutter/model/apis_response/my_response.dart';
import 'package:quran_widget_flutter/model/chapter.dart';
import 'package:quran_widget_flutter/network_helper/apis.dart';

class ChapterRepository {
  final ChapterLocalDataSource _chapterLocalDataSource =
      ChapterLocalDataSource();
  final ChapterApi _chapterApi = ChapterApi();

  Future<List<Chapter>?> fetchChaptersList({String? qurey}) async {
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
