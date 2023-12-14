import 'package:flutter/material.dart';
import 'package:p_t_v/model/book.dart';

class BooksProvider extends ChangeNotifier {
  final List<Book> bookList = [];
  final List<Book> markedBook = [];
  bool isListLoaded = false;

  BooksProvider();

  void setIsListLoaded() {
    isListLoaded = !isListLoaded;
    notifyListeners();
  }

  void addBookToBookList(Book book) {
    bookList.add(book);
    notifyListeners();
  }

  void clearBookList() {
    bookList.clear();
  }

  void addAllToBookList(List<Book> bookList) {
    this.bookList.addAll(bookList);
  }

  void deleteBook(Book book) {
    bookList.remove(book);
    notifyListeners();
  }

  void markBook(Book book) {
    if (!markedBook.any((element) => element.id == book.id) && book.checked) {
      markedBook.add(book);
    } else if (markedBook.any((element) => element.id == book.id)) {
      markedBook.removeWhere((element) => element.id == book.id);
    }
    notifyListeners();
  }
}
