import 'package:flutter/material.dart';
import 'package:p_t_v/providers/book_provider.dart';
import 'package:p_t_v/widgets/home_screen/home_list_item.dart';
import 'package:provider/provider.dart';

class HomeList extends StatelessWidget {
  const HomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BookProvider>(
      builder: (context, bookProvider, child) {
        bookProvider.fetchAll();
        return BooksList(bookProvider: bookProvider);
      },
    );
  }
}

class BooksList extends StatelessWidget {
  const BooksList({super.key, required this.bookProvider});
  final BookProvider bookProvider;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 340,
        childAspectRatio: 1.7 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return HomeListItem(book: bookProvider.bookList[index]);
      },
      itemCount: bookProvider.bookList.length,
    );
  }
}
