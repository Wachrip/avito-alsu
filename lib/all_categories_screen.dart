import 'package:avito_test/theme.dart';
import 'package:flutter/material.dart';

import 'category_list_tile.dart';
import 'detail_screen.dart';
import 'list_item.dart';

class AllCategoriesScreen extends StatelessWidget {
  final List<ListItem> list1;
  final List<ListItem> list2;
  final List<ListItem> list3;

  const AllCategoriesScreen({
    super.key,
    required this.list1,
    required this.list2,
    required this.list3,
  });

  @override
  Widget build(BuildContext context) {
    final CustomColors customColors =
        Theme.of(context).extension<CustomColors>()!;

    final List<ListItem> allCategories = [...list1, ...list2, ...list3];

    return Scaffold(
      appBar: AppBar(title: const Text('Бардык категориялар')),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        itemCount: allCategories.length,
        separatorBuilder: (context, index) => const SizedBox(height: 3),
        itemBuilder: (context, index) {
          return CategoryListTile(
            title: allCategories[index].title,
            imagePath: allCategories[index].imagePath,
            cardBackground: customColors.cardBackground,
            cardText: customColors.cardText,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      DetailScreen(title: allCategories[index].title),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
