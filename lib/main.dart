import 'package:flutter/material.dart';

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
      debugShowCheckedModeBanner: false,  // This removes the "Debug" banner
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          _menuButton(context),
        ],
      ),
      body: Center(
        child: Text('Welcome to the Home Page!'),
      ),
    );
  }
}

class ExploreRecipesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore Recipes'),
        actions: [
          _menuButton(context),
        ],
      ),
      body: Center(
        child: Text('Explore delicious recipes!'),
      ),
    );
  }
}

class MyGroceryListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Grocery List'),
        actions: [
          _menuButton(context),
        ],
      ),
      body: Center(
        child: Text('Here\'s your grocery list.'),
      ),
    );
  }
}

class MyMealPlanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Meal Plan'),
        actions: [
          _menuButton(context),
        ],
      ),
      body: Center(
        child: Text('Plan your meals here.'),
      ),
    );
  }
}

class MyFavoriteRecipesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Favorite Recipes'),
        actions: [
          _menuButton(context),
        ],
      ),
      body: Center(
        child: Text('These are your favorite recipes.'),
      ),
    );
  }
}

PopupMenuButton<String> _menuButton(BuildContext context) {
  return PopupMenuButton<String>(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("Navigation Menu", style: TextStyle(color: Colors.black)),
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
        child: Text('Home'),
      ),
      const PopupMenuItem<String>(
        value: 'Explore Recipes',
        child: Text('Explore Recipes'),
      ),
      const PopupMenuItem<String>(
        value: 'My Grocery List',
        child: Text('My Grocery List'),
      ),
      const PopupMenuItem<String>(
        value: 'My Meal Plan',
        child: Text('My Meal Plan'),
      ),
      const PopupMenuItem<String>(
        value: 'My Favorite Recipes',
        child: Text('My Favorite Recipes'),
      ),
    ],
  );
}
