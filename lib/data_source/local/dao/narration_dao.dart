import 'package:floor/floor.dart';
import 'package:quran_widget_flutter/model/narration.dart';

@dao
abstract class NarrationDao {
  @Query('SELECT * FROM Narration')
  Future<List<Narration>> findAllNarrations();

  @Query('SELECT * FROM Narration WHERE id = :id')
  Stream<Narration?> findNarrationById(int id);

  @insert
  Future<void> insertNarration(Narration narration);

  @update
  Future<void> updateNarration(Narration narration);

  @delete
  Future<void> deleteNarration(Narration narration);
}
