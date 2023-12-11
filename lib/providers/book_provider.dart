import 'package:flutter/material.dart';
import 'package:p_t_v/model/book.dart';

class BookProvider extends ChangeNotifier {
  final List<Book> bookList = [];

  BookProvider();

  void addBookToBookList(Book book) {
    bookList.add(book);
    notifyListeners();
  }

  void fetchAll() {
    bookList.clear();
    notifyListeners();
  }

  void deleteBook(Book book) {
    bookList.remove(book);
    notifyListeners();
  }
}
