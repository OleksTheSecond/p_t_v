import 'package:flutter/material.dart';
import 'package:p_t_v/model/book.dart';

class HomeListItemChoosingTile extends StatelessWidget {
  const HomeListItemChoosingTile({super.key, required this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 700),
        color:
            book.checked ? Colors.green.withOpacity(0.85) : Colors.transparent,
        curve: Curves.linear,
        child: Center(
            child: AnimatedOpacity(
          opacity: book.checked ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 400),
          child: const Icon(
            Icons.check,
            size: 60,
          ),
        )));
  }
}
