import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:p_t_v/model/book.dart';
import 'package:p_t_v/providers/book_provider.dart';
import 'package:p_t_v/widgets/home_screen/home_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const HomeList(),
      floatingActionButton: FloatingActionButton.large(
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

            // ignore: use_build_context_synchronously
            context.read<BookProvider>().addBookToBookList(book);
          }
        },
      ),
    );
  }
}
