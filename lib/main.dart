import 'package:flutter/material.dart';
import 'card.dart';


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
          style: _darkGreenTextStyle(),
        ),
        actions: [
          _menuButton(context),
        ],
      ),
      body: _backgroundContainer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Meals that Fit Your Life, Flavor that Inspires.',
                style: _mottoTextStyle(),
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
                style: _darkGreenTextStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExploreRecipesPage extends StatelessWidget {
   int index = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Explore Recipes',
          style: _darkGreenTextStyle(),
        ),
        actions: [
          _menuButton(context),
        ],
      ),
      body: _backgroundContainer(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2, // Number of columns
                                        crossAxisSpacing: 10.0,
                                        mainAxisSpacing: 10.0,
                                        childAspectRatio: 0.8, // To adjust height vs width ratio
                                      ),
                        itemCount: recipes.length,
                        itemBuilder: (context, index) {
                          final recipe = recipes[index];
                          return RecipeCard(
                         image: recipe["image"]!,
                         title: recipe["title"]!,
                          );
                        },
                      ),
                    ),
            ),
    );
        
   
  }
}

class MyGroceryListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Grocery List',
          style: _darkGreenTextStyle(),
        ),
        actions: [
          _menuButton(context),
        ],
      ),
      body: _backgroundContainer(
        child: Center(
          child: Text(
            'Here\'s your grocery list.',
            style: _darkGreenTextStyle(),
          ),
        ),
      ),
    );
  }
}

class MyMealPlanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Meal Plan',
          style: _darkGreenTextStyle(),
        ),
        actions: [
          _menuButton(context),
        ],
      ),
      body: _backgroundContainer(
        child: Center(
          child: Text(
            'Plan your meals here.',
            style: _darkGreenTextStyle(),
          ),
        ),
      ),
    );
  }
}

class MyFavoriteRecipesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Favorite Recipes',
          style: _darkGreenTextStyle(),
        ),
        actions: [
          _menuButton(context),
        ],
      ),
      body: _backgroundContainer(
        child: Center(
          child: Text(
            'These are your favorite recipes.',
            style: _darkGreenTextStyle(),
          ),
        ),
      ),
    );
  }
}

PopupMenuButton<String> _menuButton(BuildContext context) {
  return PopupMenuButton<String>(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Menu",
        style: _darkGreenTextStyle(),
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

Widget _backgroundContainer({required Widget child}) {
  
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

TextStyle _darkGreenTextStyle() {
  return TextStyle(
    color: Colors.green[900], // Dark green color
    fontWeight: FontWeight.bold, // Bold text
    fontSize: 24,
  );
}

TextStyle _mottoTextStyle() {
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