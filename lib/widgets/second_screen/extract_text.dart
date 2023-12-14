import 'dart:io';
import 'package:flutter/material.dart';
import 'package:p_t_v/model/book.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class ExtractText extends StatelessWidget {
  const ExtractText({super.key, required this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          PdfDocument document =
              PdfDocument(inputBytes: _readDocumentData(book.path));
          PdfTextExtractor extractor = PdfTextExtractor(document);
          String text = extractor.extractText(startPageIndex: 1);

          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    child: Text(text),
                  ),
                );
              });
        },
        icon: const Icon(Icons.note));
  }

  List<int> _readDocumentData(String path) {
    File file = File(path);
    return file.readAsBytesSync();
  }
}
