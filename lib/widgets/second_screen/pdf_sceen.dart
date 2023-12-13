import 'package:flutter/material.dart';
import 'package:p_t_v/model/book.dart';
import 'package:p_t_v/widgets/second_screen/extract_text.dart';
import 'package:p_t_v/widgets/second_screen/pdf_file_body.dart';

class PDFScreen extends StatelessWidget {
  const PDFScreen({super.key, required this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("PDFToVoice"),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          actions: [
            ExtractText(path: book.path),
          ],
        ),
        body: PDFFileBody(
          path: book.path,
        ));
  }
}
