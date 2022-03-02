import 'package:floor/floor.dart';
import 'package:quran_widget_flutter/model/chapter.dart';

@dao
abstract class ChapterDao {
  @Query('SELECT * FROM Chapter')
  Future<List<Chapter>> findAllChapters();

  @Query('SELECT * FROM Chapter WHERE id = :id')
  Stream<Chapter?> findChapterById(int id);

  @Query('SELECT * FROM Chapter WHERE name like :qurey')
  Future<List<Chapter>> searchInChapter(String qurey);

  @insert
  Future<void> insertChapter(Chapter chapter);

  @update
  Future<void> updateChapter(Chapter chapter);

  @delete
  Future<void> deleteChapter(Chapter chapter);
}
