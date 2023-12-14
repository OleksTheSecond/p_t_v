import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:p_t_v/database/book_db.dart';
import 'package:p_t_v/model/book.dart';
import 'package:p_t_v/providers/books_provider.dart';
import 'package:p_t_v/widgets/animation_widgets/animation_opacity.dart';
import 'package:p_t_v/widgets/home_screen/home_list.dart';
import 'package:p_t_v/widgets/home_screen/home_list_app_bar_actions/delete_books.dart';
import 'package:p_t_v/widgets/home_screen/home_list_bottom_app_bar_actions/check_all_action.dart';
import 'package:p_t_v/widgets/home_screen/home_list_bottom_app_bar_actions/uncheck_all_action.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          LinearAnimationOpacity(
              opacity: context.watch<BooksProvider>().markedItemsCount > 0
                  ? 1.0
                  : 0.0,
              child: const DeleteBooks())
        ],
      ),
      body: const HomeList(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.large(
        shape: CircleBorder(),
        child: const Icon(Icons.add),
        onPressed: () async {
          final FilePickerResult? filePickerResult = await FilePicker.platform
              .pickFiles(allowedExtensions: ['pdf'], type: FileType.custom);

          if (filePickerResult == null) {
            return;
          }

          if (filePickerResult.files.single.path != null) {
            Book book = Book(
              path: filePickerResult.files.single.path!,
              name: filePickerResult.files.single.name,
              id: 0,
            );

            BookDB().create(book: book);
            final int id = await BookDB().getLastId();
            // final List<Book> books = await BookDB().fetchAll();
            // int id = books.length;
            book = await BookDB().fetchById(id);

            context.read<BooksProvider>().addBookToBookList(book);
          }
        },
      ),
      bottomNavigationBar: LinearAnimationOpacity(
        opacity:
            context.watch<BooksProvider>().markedItemsCount > 0 ? 1.0 : 0.0,
        child: const BottomAppBar(
            padding: EdgeInsets.all(3),
            shape: CircularNotchedRectangle(),
            child: Row(
              children: [
                UnCheckAll(),
                Spacer(),
                CheckAll(),
              ],
            )),
      ),
    );
  }
}
