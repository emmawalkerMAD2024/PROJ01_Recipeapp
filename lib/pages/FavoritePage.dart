import 'package:flutter/material.dart';
import '/main.dart';
import 'FavoritePage.dart';
import '/card.dart';

class MyFavoriteRecipesPage extends StatelessWidget {

  final List<Map<String, dynamic>> favoriteRecipes;

  const MyFavoriteRecipesPage({required this.favoriteRecipes});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Favorite Recipes',
          style: darkGreenTextStyle(),
        ),
        actions: [
          menuButton(context),
        ],
      ),
      body: backgroundContainer(
        child: favoriteRecipes.isEmpty
          ? Center(child: Text("No favorite recipes yet!", style: darkGreenTextStyle()))
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 0.8,
                ),
                itemCount: favoriteRecipes.length,
                itemBuilder: (context, index) {
                  final recipe = favoriteRecipes[index];
                  return RecipeCard(
                    recipe: recipe,
                    isFavorite: true,
                    onFavoriteToggle: () {
                      // No need to toggle on the Favorites page itself
                    },
                  );
                }
              ),
            )
           )
        );
  }
}