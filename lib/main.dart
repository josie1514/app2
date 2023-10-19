import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:meal_app/screens/faq_screen.dart';
import 'package:meal_app/screens/settings_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';




void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, Object> _settings = {
    'name': false,
    'Date of Birth': false,
    'Sit Height': false,
    'Connect OMAR': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  final List<Meal> _favoriteMeals = [];
  void _setSettings(Map<String, Object> filterData) {
    _settings = filterData;

    _availableMeals = DUMMY_MEALS.where((meal) {
      /*if (_settings['Name']! && !meal.isGlutenFree) {
        return false;
      }
      if (_settings['Date of Birth']! && !meal.isLactoseFree) {
        return false;
      }
      if (_settings['Sit Height']! && !meal.isVegan) {
        return false;
      }
      if (_settings['Connect OMAR']! && !meal.isVegetarian) {
        return false;
      }*/
      return true;
      }).toList();
  }

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
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        colorScheme: ColorScheme.fromSwatch(
          //changed colors
          primarySwatch: Colors.blueGrey,
          accentColor: Colors.white,
        ),
        
       //Sara changed Categories background color

        canvasColor: Colors.white,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyMedium: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodySmall: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              titleLarge: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
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
            SettingsScreen(_settings, _setSettings),
        FaqScreen.routName: (context) => 
            const FaqScreen(),
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
