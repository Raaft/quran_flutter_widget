import 'package:quran_widget_flutter/data_source/local/quran_database_source.dart';
import 'package:quran_widget_flutter/model/page.dart';

class PageLocalDataSource {
  Future<List<Page>?> fetchPagesList({
    int? chapterId,
    int? bookId,
    int? narrationId,
  }) async {
    final db = await QuranDatabaseSource.instance.database;
    return db?.pageDao.findAllPages();
  }

  Future<List<Page>?> findChapterPage({
    int? bookId,
    int? narrationId,
    int? chapterid,
  }) async {
    final db = await QuranDatabaseSource.instance.database;
    return db?.pageDao
        .findChapterPage(narrationId ?? 0, bookId ?? 0, chapterid ?? 0);
  }

  Future<Page?> fetchPageById(int pageId) async {
    final db = await QuranDatabaseSource.instance.database;
    return db?.pageDao.findPageById(pageId).first;
  }

  fetchVerseById(int pageId) async {
    final db = await QuranDatabaseSource.instance.database;
    return await db?.verseDao.findAllVersesPage(pageId);
  }

  Future<void> savePagesList(List<Page> pagesList) async {
    final db = await QuranDatabaseSource.instance.database;
    for (var page in pagesList) {
      await db?.pageDao.insertPage(page);
      if (page.verses != null) {
        for (var verse in page.verses!) {
          print('save verse $verse');
          await db?.verseDao.insertVerse(verse);
        }
      }
      if (page.glyphs != null) {
        for (var glyph in page.glyphs!) {
          await db?.glyphDao.insertGlyph(glyph);
        }
      }
    }
  }

  Future<void> deletePagesList(List<Page> pagesList) async {
    final db = await QuranDatabaseSource.instance.database;
    for (var page in pagesList) {
      await db?.pageDao.deletePage(page);
      if (page.verses != null) {
        for (var verse in page.verses!) {
          await db?.verseDao.insertVerse(verse);
        }
      }
      if (page.glyphs != null) {
        for (var glyph in page.glyphs!) {
          await db?.glyphDao.insertGlyph(glyph);
        }
      }
    }
  }

  updateVerse(Page page) async {
    final db = await QuranDatabaseSource.instance.database;
    db!.pageDao.updatePage(page);
  }
}
