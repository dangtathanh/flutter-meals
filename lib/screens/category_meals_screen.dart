import 'package:fluter_meals/models/meal.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {

  static const routeName = '/category-meals';

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  late String _categoryTitle;
  late List<Meal> _displayedMeals;
  bool _loadInitData = false;

  @override
  void initState() {    
    // ...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadInitData) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      final categoryId = args['id'];
      _categoryTitle = args['title'] ?? '';
      _displayedMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String id)
  {
    setState(() {
      _displayedMeals.removeWhere((meal) => meal.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(_categoryTitle),
      ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: _displayedMeals[index].id,
              title: _displayedMeals[index].title,
              imgUrl: _displayedMeals[index].imageUrl,
              duration: _displayedMeals[index].duration,
              complexity: _displayedMeals[index].complexity,
              affordability: _displayedMeals[index].affordability,
              removeItem: _removeMeal,
            );
          },
          itemCount: _displayedMeals.length,
        )
    );
  }
}