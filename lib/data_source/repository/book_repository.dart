import 'package:quran_widget_flutter/data_source/local/local_data_source/book_local_data_source.dart';
import 'package:quran_widget_flutter/data_source/remote/book_api.dart';
import 'package:quran_widget_flutter/model/apis_response/my_response.dart';
import 'package:quran_widget_flutter/model/book.dart';
import 'package:quran_widget_flutter/network_helper/apis.dart';

class BookRepository {
  final BookLocalDataSource _bookLocalDataSource = BookLocalDataSource();
  final BookApi _bookApi = BookApi();

  Future<List<Book>?> fetchBooksList({String? qurey, int? narrationId}) async {
    List<Book>? booksList = (narrationId != null && narrationId > 0)
        ? _bookLocalDataSource.findBooksInNarrationId(narrationId) as List<Book>
        : (qurey != null && qurey.isNotEmpty)
            ? await _bookLocalDataSource.searchInBooks(qurey)
            : await _bookLocalDataSource.fetchBooksList();

    print('BookRepository 1 $booksList');

    if ((booksList != null && booksList.isNotEmpty)) {
      return booksList;
    } else {
      final MyResponse<Book> response =
          await _bookApi.fetchBooksList(qurey: qurey, narrationId: narrationId);
      if (response.code == Apis.codeSUCCESS) {
        booksList = response.data as List<Book>;
        print('BookRepository $booksList');
        _bookLocalDataSource.saveBooksList(booksList);
      }
      return booksList;
    }
  }

  Future<Book?> fetchBookById(int bookId) async {
    Book? book = await _bookLocalDataSource.fetchBookById(bookId);
    if (book != null) {
      return book;
    } else {
      final MyResponse<Book> response = await _bookApi.fetchBookById(bookId);
      if (response.code == Apis.codeSUCCESS) {
        book = response.data as Book?;
      }
      return book;
    }
  }
}
