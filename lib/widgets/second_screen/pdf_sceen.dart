import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:p_t_v/model/book.dart';

class PDFScreen extends StatelessWidget {
  const PDFScreen({super.key, required this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: PDFFile(
          path: book.path,
        ));
  }
}

class PDFFile extends StatelessWidget {
  const PDFFile({super.key, required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PDFView(
          filePath: path,
          enableSwipe: true,
          autoSpacing: false,
          pageFling: true,
          pageSnap: true,
          fitPolicy: FitPolicy.BOTH,
          defaultPage: 0,
          preventLinkNavigation: false,
        ),
      ],
    );
  }
}
