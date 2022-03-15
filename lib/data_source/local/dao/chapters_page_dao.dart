import 'package:floor/floor.dart';
import 'package:quran_widget_flutter/model/chapters_page.dart';

@dao
abstract class ChaptersPageDao {
  @Query('SELECT DISTINCT(pageId),* FROM ChaptersPage WHERE pageId = :pageId')
  Future<List<ChaptersPage>> searchInChapter(int pageId);

  @insert
  Future<void> insertChaptersPage(ChaptersPage chaptersPage);
}
