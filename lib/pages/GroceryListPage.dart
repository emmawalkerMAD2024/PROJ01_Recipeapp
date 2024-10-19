import 'package:flutter/material.dart';
import '/main.dart';

class MyGroceryListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Grocery List',
          style: darkGreenTextStyle(),
        ),
        actions: [
          menuButton(context),
        ],
      ),
      body: backgroundContainer(
        child: Center(
          child: Text(
            'Here\'s your grocery list.',
            style: darkGreenTextStyle(),
          ),
        ),
      ),
    );
  }
}