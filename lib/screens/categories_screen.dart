import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import '../widgets/category_item.dart';

//Sara and Josie created a text box and image box to upload our logo to 

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Stack( // Wrap the Column with a Stack
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Welcome!\nHow can we help you today?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: GridView(
                padding: const EdgeInsets.all(15),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1 / 1,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                children: dummyCategories
                    .map(
                      (catData) => CategoryItem(catData.id, catData.title, catData.color, catData.image),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter, // Position the image at the bottom
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              'assets/images/logo.png', // Replace with your image path
              width: 250, // Adjust the width as needed
              height: 150, // Adjust the height as needed
              fit: BoxFit.contain, // Adjust the fit as needed
            ),
          ),
        ),
      ],
    );
  }
}
