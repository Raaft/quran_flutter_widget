import 'package:quran_widget_flutter/data_source/local/quran_database_source.dart';
import 'package:quran_widget_flutter/model/chapter.dart';

class ChapterLocalDataSource {
  Future<List<Chapter>?> fetchChaptersList() async {
    final db = await QuranDatabaseSource.instance.database;
    return db?.chapterDao.findAllChapters();
  }

  Future<List<Chapter>?> searchInChapter({String? qurey}) async {
    final db = await QuranDatabaseSource.instance.database;
    return db?.chapterDao.searchInChapter('%${qurey ?? ''}%');
  }

  Future<void> saveChapter(Chapter chapter) async {
    final db = await QuranDatabaseSource.instance.database;
    db?.chapterDao.insertChapter(chapter);
  }

  Future<Chapter?> fetchChapterById(int chapterId) async {
    final db = await QuranDatabaseSource.instance.database;
    return db?.chapterDao.findChapterById(chapterId).first;
  }

  Future<void> saveChaptersList(List<Chapter> chaptersList) async {
    final db = await QuranDatabaseSource.instance.database;
    for (var chapter in chaptersList) {
      await db?.chapterDao.insertChapter(chapter);
    }
  }

  Future<void> deleteChaptersList(List<Chapter> chaptersList) async {
    final db = await QuranDatabaseSource.instance.database;
    for (var chapter in chaptersList) {
      await db?.chapterDao.deleteChapter(chapter);
    }
  }
}
