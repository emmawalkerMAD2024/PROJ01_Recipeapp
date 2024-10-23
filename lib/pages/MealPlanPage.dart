import 'package:flutter/material.dart';
import '/main.dart';

class MyMealPlanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Meal Plan',
          style: darkGreenTextStyle(),
        ),
        actions: [
          menuButton(context),
        ],
      ),
      body: backgroundContainer(
        child: Center(
          child: Text(
            "To add a recipe to your Meal Plan, click the 'Add to Meal Plan' icon on the recipe you'd like to add.",
            style: darkGreenTextStyle(),
          ),
        ),
      ),
    );
  }
}