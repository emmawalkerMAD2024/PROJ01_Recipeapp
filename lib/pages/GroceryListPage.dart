import 'package:flutter/material.dart';
import '/main.dart';

class MyGroceryListPage extends StatelessWidget {
  final List<String> groceryList; // Accepting the grocery list as a named parameter

  const MyGroceryListPage({Key? key, required this.groceryList}) : super(key: key);
  
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
        child: groceryList.isEmpty
            ? Center(
                child: Text(
                  "Your grocery list is empty.",
                  style: darkGreenTextStyle(),
                ),
              )
            : ListView.builder(
                itemCount: groceryList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(groceryList[index]),
                  );
                },
              ),
      ),
    );
  }
}
