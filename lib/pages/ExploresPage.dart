import 'package:flutter/material.dart';
import '/main.dart';
import '/card.dart';
import 'RecipeDetailPage.dart';



class ExploreRecipesPage extends StatelessWidget {
   
void main() {
  runApp(MyApp());
}


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
        ],
      ),
      body: backgroundContainer(
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
                        return GestureDetector(
                           onTap: () {
                              // Navigate to RecipeDetailPage when a recipe is clicked
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
}





 final List<Map<String, dynamic>> recipes = [
    {
      "image": "assets/images/recipe1.jpg",
      "title": "Spaghetti Bolognese",
      "ingredients": ["Spaghetti", "Ground Beef", "Tomato Sauce", "Onion", "Garlic"],
      "instructions": "Boil spaghetti. Cook beef with onion and garlic. Add tomato sauce. Combine and serve."
    },
    {
      "image": "assets/images/recipe2.jpg",
      "title": "Grilled Chicken",
      "ingredients": ["Chicken Breast", "Olive Oil", "Lemon", "Garlic", "Thyme"],
      "instructions": "Marinate chicken in olive oil, lemon, garlic, and thyme. Grill until fully cooked."
    },
    // Add more recipes as needed
  ];