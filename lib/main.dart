import 'package:flutter/material.dart';
import 'pages/ExploresPage.dart';
import 'pages/GroceryListPage.dart';
import 'pages/FavoritePage.dart';
import 'pages/MealPlanPage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[100],
        title: Text(
          'FlavorFit Home',
          style: darkGreenTextStyle(),
        ),
        actions: [
          menuButton(context),
        ],
      ),
      body: backgroundContainer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Meals that Fit Your Life, Flavor that Inspires.',
                style: mottoTextStyle(),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50), // Adds spacing
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ExploreRecipesPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 50), // Button size
                  backgroundColor: Colors.green, // Button color
                  textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Text style
                ),
                child: Text(
                  'Start Exploring our FlavorFit Recipes!', style: TextStyle(fontSize: 28, color: Colors.white)
                ),
              ),
              SizedBox(height: 50), // Adds spacing
              Text(
                'Welcome to the Home Page!',
                style: darkGreenTextStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}







PopupMenuButton<String> menuButton(BuildContext context) {
  return PopupMenuButton<String>(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Menu",
        style: darkGreenTextStyle(),
      ),
    ),
    onSelected: (String result) {
      switch (result) {
        case 'Home':
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          break;
        case 'Explore Recipes':
          Navigator.push(context, MaterialPageRoute(builder: (context) => ExploreRecipesPage()));
          break;
        case 'My Grocery List':
          Navigator.push(context, MaterialPageRoute(builder: (context) => MyGroceryListPage()));
          break;
        case 'My Meal Plan':
          Navigator.push(context, MaterialPageRoute(builder: (context) => MyMealPlanPage()));
          break;
        case 'My Favorite Recipes':
          Navigator.push(context, MaterialPageRoute(builder: (context) => MyFavoriteRecipesPage()));
          break;
      }
    },
    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
      const PopupMenuItem<String>(
        value: 'Home',
        child: Text('Home', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
      ),
      const PopupMenuItem<String>(
        value: 'Explore Recipes',
        child: Text('Explore Recipes', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
      ),
      const PopupMenuItem<String>(
        value: 'My Grocery List',
        child: Text('My Grocery List', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
      ),
      const PopupMenuItem<String>(
        value: 'My Meal Plan',
        child: Text('My Meal Plan', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
      ),
      const PopupMenuItem<String>(
        value: 'My Favorite Recipes',
        child: Text('My Favorite Recipes', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
      ),
    ],
  );
}

Widget backgroundContainer({required Widget child}) {
  
  return Container(
    
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/uppiez.jpg"),
        fit: BoxFit.cover,
      ),
    ),
    child: child,
  );
}

TextStyle darkGreenTextStyle() {
  return TextStyle(
    color: Colors.green[900], // Dark green color
    fontWeight: FontWeight.bold, // Bold text
    fontSize: 24,
  );
}

TextStyle mottoTextStyle() {
  return TextStyle(
    color: Colors.green[900], // Dark green color
    fontWeight: FontWeight.bold, // Bold text
    fontStyle: FontStyle.italic, // Italics
    fontSize: 44, // Large size for motto
  );
}

 final List<Map<String, String>> recipes = [
    {"image": "assets/images/recipe1.jpg", "title": "Spaghetti Bolognese"},
    {"image": "assets/images/recipe2.jpg", "title": "Grilled Chicken"},
    {"image": "assets/images/recipe3.jpg", "title": "Sushi Rolls"},
    {"image": "assets/images/recipe4.jpg", "title": "Pancakes"},
    {"image": "assets/images/recipe5.jpg", "title": "Salmon Teriyaki"},
    {"image": "assets/images/recipe6.jpg", "title": "Veggie Stir Fry"},
    {"image": "assets/images/recipe7.jpg", "title": "Tacos"},
    {"image": "assets/images/recipe8.jpg", "title": "Pizza Margherita"},
  ];