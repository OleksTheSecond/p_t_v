import 'package:flutter/material.dart';
import 'package:p_t_v/model/book.dart';

class BooksProvider extends ChangeNotifier {
  final List<Book> bookList = [];
  bool isListLoaded = false;
  int markedItemsCount = 0;

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
    markedItemsCount = markedItemsCount - 1;
    notifyListeners();
  }

  void markAll() {
    for (Book element in bookList) {
      element.checked = true;
    }
    markedItemsCount = bookList.length;
    print(markedItemsCount);
    notifyListeners();
  }

  void unMarkAll() {
    for (Book element in bookList) {
      element.checked = false;
    }
    markedItemsCount = 0;
    print(markedItemsCount);
    notifyListeners();
  }

  void markBook(Book book) {
    for (Book element in bookList) {
      if (element.id == book.id) {
        element.checked = book.checked;
      }
    }
    if (book.checked) {
      markedItemsCount = markedItemsCount + 1;
    }
    if (!book.checked) {
      markedItemsCount = markedItemsCount - 1;
    }
    print(markedItemsCount);
    notifyListeners();
  }
}
