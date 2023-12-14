import 'package:flutter/material.dart';
import 'package:p_t_v/database/book_db.dart';
import 'package:p_t_v/model/book.dart';
import 'package:p_t_v/providers/books_provider.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class DeleteBooks extends StatelessWidget {
  const DeleteBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          for (Book book in context.read<BooksProvider>().bookList) {
            if (book.checked) {
              BookDB().delete(book.id).then((value) {
                context.read<BooksProvider>().deleteBook(book);
              });
            }
          }
        },
        icon: const Icon(Icons.delete));
  }
}
