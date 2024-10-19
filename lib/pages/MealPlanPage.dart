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
            'Plan your meals here.',
            style: darkGreenTextStyle(),
          ),
        ),
      ),
    );
  }
}