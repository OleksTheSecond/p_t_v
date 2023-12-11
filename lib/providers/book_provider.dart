import 'package:flutter/material.dart';
import 'package:p_t_v/database/book_db.dart';
import 'package:p_t_v/model/book.dart';

class BookProvider extends ChangeNotifier {
  final List<Book> bookList = [];
  final List<Book> markedBook = [];

  final BookDB _bookDB = BookDB();

  BookProvider();

  void addBookToBookList(Book book) async {
    bookList.add(book);
    await _bookDB.create(book: book);
    notifyListeners();
  }

  void fetchAll() async {
    final books = await _bookDB.fetchAll();
    bookList.clear();
    bookList.addAll(books);
    notifyListeners();
  }

  void deleteBook(Book book) async {
    bookList.remove(book);
    await _bookDB.deleteByPath(book);
    notifyListeners();
  }

  void markBook(Book book) {
    if (!markedBook.any((element) => element.id == book.id) && book.checked) {
      markedBook.add(book);
    } else if (markedBook.any((element) => element.id == book.id) &&
        !book.checked) {
      markedBook.removeWhere((element) => element.id == book.id);
    }
    notifyListeners();
  }
}
