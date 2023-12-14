import 'package:flutter/material.dart';
import 'package:p_t_v/database/book_db.dart';
import 'package:p_t_v/providers/books_provider.dart';
import 'package:p_t_v/widgets/home_screen/home_list_item.dart';
import 'package:provider/provider.dart';

class HomeList extends StatelessWidget {
  const HomeList({super.key});

  @override
  Widget build(BuildContext context) {
    updateBookList(context);
    return const BooksList();
  }

  void updateBookList(BuildContext context) async {
    context.read<BooksProvider>().clearBookList();
    BookDB().fetchAll().then((value) {
      context.read<BooksProvider>().addAllToBookList(value);
      context.read<BooksProvider>().setIsListLoaded();
    });
  }
}

class BooksList extends StatelessWidget {
  const BooksList({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoaded = context.watch<BooksProvider>().isListLoaded;
    print(isLoaded);
    return isLoaded
        ? GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 340,
              childAspectRatio: 1.7 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              print("ID: ${context.watch<BooksProvider>().bookList[index].id}");
              return HomeListItem(
                  book: context.watch<BooksProvider>().bookList[index]);
            },
            itemCount: context.watch<BooksProvider>().bookList.length,
          )
        : loadedBar();
  }

  Widget loadedBar() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
