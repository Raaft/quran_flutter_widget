import 'package:quran_widget_flutter/data_source/local/local_data_source/book_local_data_source.dart';
import 'package:quran_widget_flutter/data_source/remote/book_api.dart';
import 'package:quran_widget_flutter/model/apis_response/my_response.dart';
import 'package:quran_widget_flutter/model/book.dart';
import 'package:quran_widget_flutter/network_helper/apis.dart';

class BookRepository {
  final BookLocalDataSource _bookLocalDataSource = BookLocalDataSource();
  final BookApi _bookApi = BookApi();

  Future<List<Book>?> fetchBooksList() async {
    List<Book>? booksList = await _bookLocalDataSource.fetchBooksList();
    if ((booksList != null && booksList.isNotEmpty)) {
      return booksList;
    } else {
      final MyResponse<Book> response = await _bookApi.fetchBooksList();
      if (response.code == Apis.CODE_SUCCESS) {
        booksList = response.data as List<Book>;
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
      if (response.code == Apis.CODE_SUCCESS) {
        book = response.data as Book?;
      }
      return book;
    }
  }
}
