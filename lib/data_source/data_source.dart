import 'package:quran_widget_flutter/data_source/repository/book_repository.dart';
import 'package:quran_widget_flutter/data_source/repository/chapter_repository.dart';
import 'package:quran_widget_flutter/data_source/repository/narration_repository.dart';
import 'package:quran_widget_flutter/data_source/repository/part_repository.dart';
import 'package:quran_widget_flutter/data_source/repository/page_repository.dart';
import 'package:quran_widget_flutter/data_source/repository/recitation_repository.dart';
import 'package:quran_widget_flutter/data_source/repository/recitation_verses_repository.dart';
import 'package:quran_widget_flutter/data_source/repository/reciter_repository.dart';
import 'package:quran_widget_flutter/model/book.dart';
import 'package:quran_widget_flutter/model/chapter.dart';
import 'package:quran_widget_flutter/model/narration.dart';
import 'package:quran_widget_flutter/model/page.dart';
import 'package:quran_widget_flutter/model/part.dart';
import 'package:quran_widget_flutter/model/recitation.dart';
import 'package:quran_widget_flutter/model/recitation_verses.dart';
import 'package:quran_widget_flutter/model/reciter.dart';

class DataSource {
  static final DataSource _ds = DataSource._internalInstance();

  DataSource._internalInstance();

  static DataSource get instance => _ds;

  factory DataSource() => instance;

  final NarrationRepository _narrationRepository = NarrationRepository();
  final BookRepository _bookRepository = BookRepository();

  final ChapterRepository _chapterRepository = ChapterRepository();
  final PartRepository _partRepository = PartRepository();
  final PageRepository _pageRepository = PageRepository();
  final RecitationRepository _recitationRepository = RecitationRepository();
  final RecitationVersesRepository _recitationVersesRepository =
      RecitationVersesRepository();
  final ReciterRepository _reciterRepository = ReciterRepository();

  Future<List<Narration>?> fetchNarrationsList({String? qurey}) =>
      _narrationRepository.fetchNarrationsList(qurey: qurey);

  Future<Narration?> fetchNarrationById(int narrationId) =>
      _narrationRepository.fetchNarrationById(narrationId);

  Future<List<Book>?> fetchBooksList({String? qurey, int? narrationId}) =>
      _bookRepository.fetchBooksList(qurey: qurey, narrationId: narrationId);

  Future<Book?> fetchBookById(int bookId) =>
      _bookRepository.fetchBookById(bookId);

  Future<List<Chapter>?> fetchChaptersList({String? qurey}) =>
      _chapterRepository.fetchChaptersList(qurey: qurey);

  Future<Chapter?> fetchChapterById(int chapterId) =>
      _chapterRepository.fetchChapterById(chapterId);

  Future<List<Part>?> fetchPartsList() => _partRepository.fetchPartsList();

  Future<Part?> fetchPartById(int partId) =>
      _partRepository.fetchPartById(partId);

  Future<List<Page>?> fetchPagesList() => _pageRepository.fetchPagesList();

  Future<Page?> fetchPageById(int pageId) =>
      _pageRepository.fetchPageById(pageId);

  Future<List<Recitation>?> fetchRecitationsList() =>
      _recitationRepository.fetchRecitationsList();

  Future<Recitation?> fetchRecitationById(int recitationId) =>
      _recitationRepository.fetchRecitationById(recitationId);

  Future<List<RecitationVerses>?> fetchRecitationsVersesList(
          int recitationId) =>
      _recitationVersesRepository.fetchRecitationsVersesList(recitationId);

  Future<RecitationVerses?> fetchRecitationVersesById(
          int recitationId, int recitationVersesId) =>
      _recitationVersesRepository.fetchRecitationVersesById(
          recitationId, recitationVersesId);

  Future<List<Reciter>?> fetchRecitersList({String? qurey}) =>
      _reciterRepository.fetchRecitersList(qurey: qurey);

  Future<Reciter?> fetchReciterById(int reciterId) =>
      _reciterRepository.fetchReciterById(reciterId);
}
