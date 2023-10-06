import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_meals_screen.dart';

//Josie and Sara revised this code to remove gradient colors

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  final String image;

  const CategoryItem(this.id, this.title, this.color, this.image, {super.key});

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
        child: Column(
          children: [
            Container(
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Container(
              //created this container to include images inside our buttons
              child: Image.asset(
                image, // Replace with your image path
                width: 100, // Adjust the width as needed
                height: 100, // Adjust the height as needed
                fit: BoxFit.contain, // Adjust the fit as needed
              ),
            )
          ],
        ),
      ),
    );
  }
}