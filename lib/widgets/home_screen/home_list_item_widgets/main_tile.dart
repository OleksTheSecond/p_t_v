import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:p_t_v/model/book.dart';

class HomeListItemMainTile extends StatelessWidget {
  final Book book;

  const HomeListItemMainTile({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: GridTile(
        footer: GridTileBar(
          title: Text(
            book.name,
            style: const TextStyle(color: Colors.black),
          ),
          backgroundColor:
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.7),
        ),
        child: PDFView(
          filePath: book.path,
          enableSwipe: false,
          autoSpacing: false,
          pageFling: false,
          pageSnap: false,
          fitPolicy: FitPolicy.BOTH,
        ),
      ),
    );
  }
}
