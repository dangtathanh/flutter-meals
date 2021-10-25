import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {

  static const routeName = '/category-meals';

  // final String categoryId;
  // final String categoryName;

  // CategoryMealsScreen(this.categoryId, this.categoryName);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = args['id'];
    final categoryName = args['name'] ?? 'Halo';

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: const Center(
        child: Text(
          'The Recipes For The Category',
        ),
      ),
    );
  }
}