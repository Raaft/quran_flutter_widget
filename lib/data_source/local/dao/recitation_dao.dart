import 'package:floor/floor.dart';
import 'package:quran_widget_flutter/model/recitation.dart';

@dao
abstract class RecitationDao {
  @Query('SELECT * FROM Recitation')
  Future<List<Recitation>> findAllRecitations();

  @Query(
      'SELECT * FROM Recitation WHERE narration = :narrationId and reciter = :reciterId')
  Future<List<Recitation>> findRecitations(int narrationId, int reciterId);

  @Query('SELECT * FROM Recitation WHERE id = :id')
  Stream<Recitation?> findRecitationById(int id);

  @insert
  Future<void> insertRecitation(Recitation recitation);

  @update
  Future<void> updateRecitation(Recitation recitation);

  @delete
  Future<void> deleteRecitation(Recitation recitation);
}
