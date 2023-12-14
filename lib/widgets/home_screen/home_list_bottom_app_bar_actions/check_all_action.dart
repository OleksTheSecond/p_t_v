import 'package:flutter/material.dart';
import 'package:p_t_v/providers/books_provider.dart';
import 'package:provider/provider.dart';

class CheckAll extends StatelessWidget {
  const CheckAll({super.key});

  @override
  Widget build(BuildContext context) {
    return context.watch<BooksProvider>().markedItemsCount > 0
        ? TextButton.icon(
            onPressed: () {
              context.read<BooksProvider>().markAll();
            },
            label: Text("MARK ALL"),
            icon: Icon(Icons.check_circle),
          )
        : Container();
  }
}
