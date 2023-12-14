import 'package:flutter/material.dart';
import 'package:p_t_v/model/book.dart';
import 'package:p_t_v/providers/books_provider.dart';
import 'package:p_t_v/widgets/home_screen/home_list_item_widgets/choosing_tile.dart';
import 'package:p_t_v/widgets/second_screen/pdf_sceen.dart';
import 'package:provider/provider.dart';

class HomeListItemTappingTile extends StatefulWidget {
  const HomeListItemTappingTile({super.key, required this.book});
  final Book book;

  @override
  State<HomeListItemTappingTile> createState() =>
      _HomeListItemTappingTileState();
}

class _HomeListItemTappingTileState extends State<HomeListItemTappingTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: HomeListItemChoosingTile(book: widget.book),
      onTap: () {
        if (widget.book.checked) {
          unMarked();
          return;
        }

        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => PDFScreen(book: widget.book)));
      },
      onLongPress: () {
        setState(() {
          widget.book.checked = !widget.book.checked;
          context.read<BooksProvider>().markBook(widget.book);
        });
      },
    );
  }

  void unMarked() {
    setState(() {
      widget.book.checked = false;
      context.read<BooksProvider>().markBook(widget.book);
    });
  }
}
