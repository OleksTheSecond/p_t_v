import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:p_t_v/model/book.dart';
import 'package:p_t_v/providers/book_provider.dart';
import 'package:provider/provider.dart';

class HomeListItem extends StatefulWidget {
  const HomeListItem({super.key, required this.book});
  final Book book;

  @override
  State<HomeListItem> createState() => _HomeListItemState();
}

class _HomeListItemState extends State<HomeListItem> {
  double opacityLevel = 0.0;
  bool marked = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        pdfTile(context),
        markedTile(),
        tapingTile(context),
      ],
    );
  }

  Widget markedTile() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 700),
      color: !marked ? Colors.transparent : Colors.green.withOpacity(0.85),
      curve: Curves.linear,
      child: Center(
          child: AnimatedOpacity(
        opacity: opacityLevel,
        duration: const Duration(milliseconds: 400),
        child: const Icon(
          Icons.check,
          size: 60,
        ),
      )),
    );
  }

  Widget pdfTile(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: GridTile(
        footer: GridTileBar(
          title: Text(
            widget.book.name,
            style: const TextStyle(color: Colors.black),
          ),
          backgroundColor:
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.7),
        ),
        child: PDFView(
          filePath: widget.book.path,
          enableSwipe: false,
          autoSpacing: false,
          pageFling: false,
          pageSnap: false,
          fitPolicy: FitPolicy.BOTH,
        ),
      ),
    );
  }

  Widget tapingTile(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        setState(() {
          marked = !marked;
          widget.book.checked = marked;
          opacityLevel = opacityLevel == 0.0 ? 1.0 : 0.0;
          context.read<BookProvider>().markBook(widget.book);
        });
      },
    );
  }
}
