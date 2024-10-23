import 'package:flutter/material.dart';
import '/main.dart';

class MyFavoriteRecipesPage extends StatelessWidget {
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
        child: Center(
          child: Text(
            "To add a recipe to your Favorite Recipes list, click the 'Add to Favorites' icon on the recipe you'd like to add.",
            style: darkGreenTextStyle(),
          ),
        ),
      ),
    );
  }
}