import 'package:floor/floor.dart';
import 'package:quran_widget_flutter/model/page.dart';

@dao
abstract class PageDao {
  @Query('SELECT * FROM Page')
  Future<List<Page>> findAllPages();

  @Query('SELECT * FROM Page WHERE id = :id')
  Stream<Page?> findPageById(int id);

  @insert
  Future<void> insertPage(Page page);

  @update
  Future<void> updatePage(Page page);

  @delete
  Future<void> deletePage(Page page);
}