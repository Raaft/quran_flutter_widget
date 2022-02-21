import 'package:floor/floor.dart';
import 'package:quran_widget_flutter/model/recitation_verses.dart';

@dao
abstract class RecitationVersesDao {
  @Query('SELECT * FROM RecitationVerses')
  Future<List<RecitationVerses>> findAllRecitationsVerses();

  @Query('SELECT * FROM RecitationVerses WHERE id = :id')
  Stream<RecitationVerses?> findRecitationVersesById(int id);

  @insert
  Future<void> insertRecitationVerses(RecitationVerses recitationVerses);

  @update
  Future<void> updateRecitationVerses(RecitationVerses recitationVerses);

  @delete
  Future<void> deleteRecitationVerses(RecitationVerses recitationVerses);
}