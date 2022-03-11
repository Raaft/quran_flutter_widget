import 'package:quran_widget_flutter/data_source/local/local_data_source/page_local_data_source.dart';
import 'package:quran_widget_flutter/data_source/remote/page_api.dart';
import 'package:quran_widget_flutter/model/apis_response/my_response.dart';
import 'package:quran_widget_flutter/model/page.dart';
import 'package:quran_widget_flutter/network_helper/apis.dart';

class PageRepository {
  final PageLocalDataSource _pageLocalDataSource = PageLocalDataSource();
  final PageApi _pageApi = PageApi();

  Future<List<Page>?> fetchPagesList({
    int? bookId,
    int? narrationId,
  }) async {
    List<Page>? pagesList = await _pageLocalDataSource.fetchPagesList();

    if ((pagesList != null && pagesList.isNotEmpty)) {
      for (var element in pagesList) {
        element.verses =
            await _pageLocalDataSource.fetchVerseById(element.id ?? 0);
        //print('getVerse ${element.verses}');
      }

      return pagesList;
    } else {
      final MyResponse<Page> response = await _pageApi.fetchPagesList();
      if (response.code == Apis.codeSUCCESS) {
        pagesList = response.data as List<Page>;
        _pageLocalDataSource.savePagesList(pagesList);
      }

      return pagesList;
    }
  }

  Future<List<Page>?> fetchPagesListDown({
    int? bookId,
    int? narrationId,
  }) async {
    List<Page>? pagesList = await _pageLocalDataSource.findChapterPage(
        bookId: bookId, chapterid: 1, narrationId: narrationId);

    if ((pagesList != null && pagesList.isNotEmpty)) {
      for (var element in pagesList) {
        element.verses =
            await _pageLocalDataSource.fetchVerseById(element.id ?? 0);
        //print('getVerse ${element.verses}');
      }

      return pagesList;
    } else {
      try {
        List<Page>? pagesList;

        final MyResponse<Page> response = await _pageApi.fetchPagesListDown(
            bookId: bookId, narrationId: narrationId);

        print('done returen');

        if (response.code == Apis.codeSUCCESS) {
          pagesList = response.data as List<Page>;
          print('ResponseDownload ${pagesList.whereType()} $pagesList ');
          _pageLocalDataSource.savePagesList(pagesList);
        } else {
          print('else $response');
        }

        return pagesList;
      } catch (e) {
        print(e.toString());
      }
    }
    return null;
  }

  Future<Page?> fetchPageById(int pageId) async {
    Page? page = await _pageLocalDataSource.fetchPageById(pageId);
    if (page != null) {
      page.verses = await _pageLocalDataSource.fetchVerseById(page.id ?? 0);
      //print('getVerse ${page.verses}');
      return page;
    } else {
      final MyResponse<Page> response = await _pageApi.fetchPageById(pageId);
      if (response.code == Apis.codeSUCCESS) {
        page = response.data as Page?;
      }
      return page;
    }
  }
}
