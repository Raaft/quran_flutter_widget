import 'dart:async';

import 'package:floor/floor.dart';
import 'package:quran_widget_flutter/data_source/local/dao/book_dao.dart';
import 'package:quran_widget_flutter/data_source/local/dao/chapter_dao.dart';
import 'package:quran_widget_flutter/data_source/local/dao/chapters_page_dao.dart';
import 'package:quran_widget_flutter/data_source/local/dao/glyph_dao.dart';
import 'package:quran_widget_flutter/data_source/local/dao/narration_dao.dart';
import 'package:quran_widget_flutter/data_source/local/dao/page_dao.dart';
import 'package:quran_widget_flutter/data_source/local/dao/part_dao.dart';
import 'package:quran_widget_flutter/data_source/local/dao/recitation_dao.dart';
import 'package:quran_widget_flutter/data_source/local/dao/recitation_verse_dao.dart';
import 'package:quran_widget_flutter/data_source/local/dao/reciter_dao.dart';
import 'package:quran_widget_flutter/data_source/local/dao/verse_dao.dart';
import 'package:quran_widget_flutter/model/book.dart';
import 'package:quran_widget_flutter/model/chapter.dart';
import 'package:quran_widget_flutter/model/chapters_page.dart';
import 'package:quran_widget_flutter/model/glyph.dart';
import 'package:quran_widget_flutter/model/narration.dart';
import 'package:quran_widget_flutter/model/page.dart';
import 'package:quran_widget_flutter/model/part.dart';
import 'package:quran_widget_flutter/model/recitation.dart';
import 'package:quran_widget_flutter/model/recitation_verses.dart';
import 'package:quran_widget_flutter/model/reciter.dart';
import 'package:quran_widget_flutter/model/verse.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'quran_database.g.dart';

@Database(version: 1, entities: [
  Narration,
  Book,
  Chapter,
  Part,
  Page,
  Recitation,
  Reciter,
  RecitationVerses,
  Verse,
  Glyph,
  ChaptersPage
])
abstract class QuranDatabase extends FloorDatabase {
  NarrationDao get narrationDao;
  BookDao get bookDao;
  ChapterDao get chapterDao;
  PartDao get partDao;
  PageDao get pageDao;
  RecitationDao get recitationDao;
  ReciterDao get reciterDao;
  RecitationVersesDao get recitationVersesDao;
  VerseDao get verseDao;
  GlyphDao get glyphDao;
  ChaptersPageDao get chaptersPageDao;
}
