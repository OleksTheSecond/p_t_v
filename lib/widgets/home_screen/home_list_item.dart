import 'package:flutter/material.dart';
import 'package:p_t_v/model/book.dart';
import 'package:p_t_v/widgets/home_screen/home_list_item_widgets/main_tile.dart';
import 'package:p_t_v/widgets/home_screen/home_list_item_widgets/taping_tile.dart';

class HomeListItem extends StatelessWidget {
  const HomeListItem({super.key, required this.book});
  final Book book;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HomeListItemMainTile(book: book),
        HomeListItemTappingTile(book: book),
      ],
    );
  }
}
