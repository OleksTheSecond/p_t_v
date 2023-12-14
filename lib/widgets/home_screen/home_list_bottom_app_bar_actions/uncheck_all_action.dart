import 'package:flutter/material.dart';
import 'package:p_t_v/providers/books_provider.dart';
import 'package:provider/provider.dart';

class UnCheckAll extends StatelessWidget {
  const UnCheckAll({super.key});

  @override
  Widget build(BuildContext context) {
    return context.watch<BooksProvider>().markedItemsCount > 0
        ? TextButton.icon(
            style: const ButtonStyle(
                padding:
                    MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.all(8))),
            onPressed: () {
              context.read<BooksProvider>().unMarkAll();
            },
            label: Text("UNMARK ALL"),
            icon: const Icon(Icons.clear),
          )
        : Container();
  }
}
