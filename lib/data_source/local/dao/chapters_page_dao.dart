import 'package:floor/floor.dart';
import 'package:quran_widget_flutter/model/chapters_page.dart';

@dao
abstract class ChaptersPageDao {
  @insert
  Future<void> insertChaptersPage(ChaptersPage chaptersPage);
}
