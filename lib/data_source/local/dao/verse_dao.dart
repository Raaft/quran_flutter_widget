import 'package:floor/floor.dart';
import 'package:quran_widget_flutter/model/verse.dart';

@dao
abstract class VerseDao {
  @Query('SELECT * FROM Verse')
  Future<List<Verse>> findAllVerses();

  @Query('SELECT * FROM Verse WHERE id = :id')
  Stream<Verse?> findVerseById(int id);

  @insert
  Future<void> insertVerse(Verse verse);

  @update
  Future<void> updateVerse(Verse verse);

  @delete
  Future<void> deleteVerse(Verse verse);
}