import 'package:floor/floor.dart';
import 'package:quran_widget_flutter/model/book.dart';

@dao
abstract class BookDao {
  @Query('SELECT * FROM Book')
  Future<List<Book>> findAllBooks();

  @Query('SELECT * FROM Book WHERE name like :qurey')
  Future<List<Book>> searchInBooks(String qurey);

  @Query('SELECT * FROM Book WHERE narration_id = :narrationId')
  Future<List<Book>> findBooksInNarrationId(int narrationId);

  @Query('SELECT * FROM Book WHERE id = :id')
  Stream<Book?> findBookById(int id);

  @insert
  Future<void> insertBook(Book book);

  @update
  Future<void> updateBook(Book book);

  @delete
  Future<void> deleteBook(Book book);
}
