import 'package:flutter/material.dart';
import '/main.dart';
import '/card.dart';
import 'RecipeDetailPage.dart';

class ExploreRecipesPage extends StatefulWidget {
  @override
  ExploreRecipesPageState createState() => ExploreRecipesPageState();
}

class ExploreRecipesPageState extends State<ExploreRecipesPage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Explore Recipes',
          style: darkGreenTextStyle(),
        ),
        actions: [
          menuButton(context),
          _buildDietToggle()
        ],
      ),
      body: backgroundContainer(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2, 
                                        crossAxisSpacing: 10.0,
                                        mainAxisSpacing: 10.0,
                                        childAspectRatio: 0.8, 
                                      ),
                        itemCount: _filteredRecipes.length,
                        itemBuilder: (context, index) {
                        final recipe = _filteredRecipes[index];
                        return GestureDetector(
                           onTap: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                             builder: (context) => RecipeDetailPage(recipe: recipe),
                                    ),
                                  );
                                },
                                child: RecipeCard(
                                                     image: recipe["image"]!,
                                                     title: recipe["title"]!,
                            ),
                          );
                        },
                      ),
                    ),
            ),
    );
  }

  Widget _buildDietToggle() {
    return PopupMenuButton<String>(
      onSelected: (String newDiet) {
        setState(() {
          selectedDiet = newDiet;  
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'all',
          child: Text('All Recipes'),
        ),
        const PopupMenuItem<String>(
          value: 'vegetarian',
          child: Text('Vegetarian'),
        ),
        const PopupMenuItem<String>(
          value: 'non-vegetarian',
          child: Text('Non-Vegetarian'),
        ),
      ],
      icon: Icon(Icons.filter_list),
    );
  }
}

String selectedDiet = 'all';

 List<Map<String, dynamic>> get _filteredRecipes {
    if (selectedDiet == 'all') {
      return recipes;
    }
    return recipes.where((recipe) => recipe['diet'] == selectedDiet).toList();
  }

 final List<Map<String, dynamic>> recipes = [
    {
      "image": "assets/images/recipe1.jpg",
      "title": "Spaghetti Bolognese",
      "ingredients": ["Spaghetti", "Ground Beef", "Tomato Sauce", "Onion", "Garlic"],
      "instructions": "Boil spaghetti. Cook beef with onion and garlic. Add tomato sauce. Combine and serve.",
      "diet": "vegetarian"
    },
    {
      "image": "assets/images/recipe2.jpg",
      "title": "Grilled Chicken",
      "ingredients": ["Chicken Breast", "Olive Oil", "Lemon", "Garlic", "Thyme"],
      "instructions": "Marinate chicken in olive oil, lemon, garlic, and thyme. Grill until fully cooked.",
      "diet": "non-vegetarian"
    },
    
    // Add more recipes as needed
  ];

  