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
            'These are your favorite recipes.',
            style: darkGreenTextStyle(),
          ),
        ),
      ),
    );
  }
}