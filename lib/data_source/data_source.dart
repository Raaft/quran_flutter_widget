import 'package:quran_widget_flutter/data_source/local/file_storage/download_book.dart';
import 'package:quran_widget_flutter/data_source/local/file_storage/download_chapter.dart';
import 'package:quran_widget_flutter/data_source/remote/tafsir_api.dart';
import 'package:quran_widget_flutter/data_source/remote/tajweed_api.dart';
import 'package:quran_widget_flutter/data_source/remote/translation_api.dart';
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
import 'package:quran_widget_flutter/model/explanation_model.dart';
import 'package:quran_widget_flutter/model/narration.dart';
import 'package:quran_widget_flutter/model/page.dart' as page;
import 'package:quran_widget_flutter/model/part.dart';
import 'package:quran_widget_flutter/model/recitation.dart';
import 'package:quran_widget_flutter/model/recitation_verses.dart';
import 'package:quran_widget_flutter/model/reciter.dart';
import 'package:quran_widget_flutter/model/tajweed_model.dart';
import 'package:quran_widget_flutter/model/translation_model.dart';
import 'package:quran_widget_flutter/model/verse.dart';
import 'package:quran_widget_flutter/plugin_auth/quran_widget_init.dart';

class DataSource {
  static final DataSource _ds = DataSource._internalInstance();

  DataSource._internalInstance();

  static DataSource get instance => _ds;

  factory DataSource() => instance;

  static Future<void> initialApp(
          {required String clientId, required String clientSecret}) =>
      QuranWidgetInit.init(clientId: clientId, clientSecret: clientSecret);

  final NarrationRepository _narrationRepository = NarrationRepository();
  final BookRepository _bookRepository = BookRepository();


  final ChapterRepository _chapterRepository = ChapterRepository();
  final PartRepository _partRepository = PartRepository();
  final PageRepository _pageRepository = PageRepository();
  final RecitationRepository _recitationRepository = RecitationRepository();
  final RecitationVersesRepository _recitationVersesRepository =
      RecitationVersesRepository();
  final ReciterRepository _reciterRepository = ReciterRepository();

  final TranslationApi _translationApi = TranslationApi();
  final TajweedApi _tajweedApi = TajweedApi();
  final TafseerApi _tafseerApi = TafseerApi();

  Future<List<TajweedModel>?> fetchTajweedList() =>
_tajweedApi.fetchTajweedList();

  Future<List<TranslationModel>?>fetchTranslationList() =>
_translationApi.fetchTranslationList();

  Future<List<ExplanationModel>?> fetchTafseerList() => _tafseerApi.fetchTafseerList();

  Future<List<Narration>?> fetchNarrationsList({String? qurey}) =>
      _narrationRepository.fetchNarrationsList(qurey: qurey);

  Future<Narration?> fetchNarrationById(int narrationId) =>
      _narrationRepository.fetchNarrationById(narrationId);

  Future<Verse?>? fetchVerseById(int vsersId) async =>
      await _pageRepository.fetchVerseById(vsersId);

  Future<List<Book>?> fetchBooksList({String? qurey, int? narrationId}) =>
      _bookRepository.fetchBooksList(qurey: qurey, narrationId: narrationId);

  Future<Book?> fetchBookById(int bookId) =>
      _bookRepository.fetchBookById(bookId);

  Future<List<Chapter>?> fetchChaptersList({
    String? qurey,
    bool? fromIndex,
    int? bookId,
    int? narrationId,
  }) =>
      _chapterRepository.fetchChaptersList(
        qurey: qurey,
        fromIndex: fromIndex,
        bookId: bookId,
        narrationId: narrationId,
      );

  Future<Chapter?> fetchChapterById(int chapterId) =>
      _chapterRepository.fetchChapterById(chapterId);

  Future<List<Part>?> fetchPartsList({String? qurey}) =>
      _partRepository.fetchPartsList();

  Future<Part?> fetchPartById(int partId) =>
      _partRepository.fetchPartById(partId);

  Future<List<page.Page>?> fetchPagesList({
    int? bookId,
    int? narrationId,
    int? chapterId,
  }) =>
      _pageRepository.fetchPagesList(
          bookId: bookId, narrationId: narrationId, chapterId: chapterId);

  Future<List<page.Page>?> fetchPagesListDown({
    int? bookId,
    int? narrationId,
  }) =>
      _pageRepository.fetchPagesListDown(
          bookId: bookId, narrationId: narrationId);

  Future<page.Page?> fetchPageById(int pageId) =>
      _pageRepository.fetchPageById(pageId);

  Future<List<Recitation>?> fetchRecitationsList({
    String? qurey,
    int? reciterId,
    int? narrationId,
  }) =>
      _recitationRepository.fetchRecitationsList(
          narrationId: narrationId, reciterId: reciterId, qurey: qurey);

  Future<Recitation?> fetchRecitationById(int recitationId) =>
      _recitationRepository.fetchRecitationById(recitationId);

  Future<List<RecitationVerses>?> fetchRecitationsVersesList({
    int? chapterId,
    required int recitationId,
  }) =>
      _recitationVersesRepository.fetchRecitationsVersesList(
          recitationId, chapterId);

  Future<RecitationVerses?> fetchRecitationVersesById(
          int recitationId, int recitationVersesId) =>
      _recitationVersesRepository.fetchRecitationVersesById(
          recitationId, recitationVersesId);

  Future<List<RecitationVerses>?> fetchRecitationsVersesChapterList(
          {required int chapterId, required int recitationId}) =>
      _recitationVersesRepository.fetchRecitationsVersesChapterList(
          chapterId, recitationId);

  Future<List<Reciter>?> fetchRecitersList({String? qurey}) =>
      _reciterRepository.fetchRecitersList(qurey: qurey);

  Future<Reciter?> fetchReciterById(int reciterId) =>
      _reciterRepository.fetchReciterById(reciterId);

  Future<void> downloadChapter({
    required int chapterId,
    required int recitationId,
    required int reciterId,
    required int narrationId,
    Function(double)? retunProgress,
  }) async {
    DownloadChapter.startDownload(
      chapterId: chapterId,
      recitationId: recitationId,
      retunProgress: retunProgress,
      reciterId: reciterId,
      narrationId: narrationId,
    );
  }

  Future<void> downloadBook(
      {int? bookId, int? narrationId, Function(double)? retunProgress}) async {
    DownloadBook.startDownload(
        bookId: bookId, narrationId: narrationId, retunProgress: retunProgress);
  }

/*  VoidCallback onPressFun;

  void onPress(VoidCallback onPress) {
    onPressFun= onPress;
  }
  void onLongPress(VoidCallback onLongPress)=>onLongPress*/
}
