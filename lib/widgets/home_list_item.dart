import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:p_t_v/model/book.dart';

class HomeListItem extends StatefulWidget {
  const HomeListItem({super.key, required this.book});
  final Book book;

  @override
  State<HomeListItem> createState() => _HomeListItemState();
}

class _HomeListItemState extends State<HomeListItem> {
  bool tapped = false;
  double opacityLevel = 1.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [bookItem(context), greenContainer(), tapItem()],
    );
  }

  Widget greenContainer() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 700),
      color: !tapped ? Colors.transparent : Colors.green.withOpacity(0.85),
      curve: Curves.linear,
      child: Center(
          child: AnimatedOpacity(
        opacity: opacityLevel,
        duration: Duration(milliseconds: 400),
        child: Icon(
          Icons.check,
          size: 60,
        ),
      )),
    );
  }

  Widget bookItem(BuildContext context) {
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

  Widget tapItem() {
    return GestureDetector(
      onLongPress: () {
        setState(() {
          tapped = !tapped;
          opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;
        });
      },
    );
  }
}
