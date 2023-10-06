import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_meals_screen.dart';

//Josie and Sara revised this code to remove gradient colors

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  const CategoryItem(this.id, this.title, this.color, {super.key});

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealScreen.routName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // Replace InkWell with GestureDetector
      onTap: () => selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color, // Set the background color to 'color'
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}