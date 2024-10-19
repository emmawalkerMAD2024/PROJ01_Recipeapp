import 'package:flutter/material.dart';
import '/main.dart';
import 'package:p1_recipeapp_emmajared/card.dart';



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