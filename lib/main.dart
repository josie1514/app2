import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:meal_app/screens/faq_screen.dart';
import 'package:meal_app/screens/settings_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/about_screen.dart';
import 'package:provider/provider.dart';
import 'screens/background_screen.dart';
import 'screens/connect_omar.dart';
import 'models/user_data.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserSettings(),
      child: MyApp()
      ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = DUMMY_MEALS;
  final List<Meal> _favoriteMeals = [];

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Raleway',
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 25,  //font size for "Categories"
                fontWeight: FontWeight.bold)),
        colorScheme: ColorScheme.fromSwatch(
          //changed colors
          primarySwatch: Colors.blueGrey, //color of app bar  background
          accentColor: Colors.white, //color of app bar text
        ),
        
       //Sara changed Categories background color

        canvasColor: Colors.white,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyMedium: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodySmall: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              titleLarge: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 21, //font size for buttons title
                fontWeight: FontWeight.bold,
              ),
              titleMedium: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              titleSmall: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      title: "IkiMeal",
      //home: CategoriesScreen(),
      initialRoute: '/Home', //default is '/'
      routes: {
        '/Home': (context) => TabsScreen(_favoriteMeals),
        // '/category-meals': (context) => CategoryMealScreen(),
        CategoryMealScreen.routName: (context) =>
            CategoryMealScreen(_availableMeals),
        MealDetailScreen.routName: (context) =>
            MealDetailScreen(_toggleFavorite, _isMealFavorite),
        SettingsScreen.routName: (context) =>
            SettingsScreen(),
        ConnectOmar.routName: (context) => 
            ConnectOmar(),
        FaqScreen.routName: (context) => 
            const FaqScreen(),
        AboutScreen.routName: (context) => 
            const AboutScreen(),
      },
       onUnknownRoute: (void settings) {
        MaterialPageRoute(
          builder: ((context) => TabsScreen(_favoriteMeals)),
        );
        return null;
      },
    );
  }
}
