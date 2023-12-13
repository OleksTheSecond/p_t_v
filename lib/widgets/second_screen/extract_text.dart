import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class ExtractText extends StatelessWidget {
  const ExtractText({super.key, required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          PdfDocument document =
              PdfDocument(inputBytes: _readDocumentData(path));
          PdfTextExtractor extractor = PdfTextExtractor(document);
          String text = extractor.extractText(startPageIndex: 1);

          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: SingleChildScrollView(
                    child: Text(text),
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
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
