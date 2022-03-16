import 'package:floor/floor.dart';
import 'package:quran_widget_flutter/model/chapter_download.dart';

@dao
abstract class ChapterDownloadDao {
  @Query('SELECT * FROM ChapterDownload')
  Future<List<ChapterDownload>> findAllChapterDownloads();

  @Query('SELECT * FROM ChapterDownload WHERE id = :id')
  Future<ChapterDownload?> findChapterDownloadById(int id);

  @insert
  Future<void> insertChapterDownload(ChapterDownload chapterDownload);

  @update
  Future<void> updateChapterDownload(ChapterDownload chapterDownload);

  @delete
  Future<void> deleteChapterDownload(ChapterDownload chapterDownload);
}
