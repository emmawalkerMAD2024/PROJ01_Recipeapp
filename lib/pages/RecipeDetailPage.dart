import 'package:flutter/material.dart';
import '/main.dart';

class RecipeDetailPage extends StatelessWidget {
  final Map<String, dynamic> recipe;

  const RecipeDetailPage({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe["title"],
        style: darkGreenTextStyle(),),
      ),
      body: backgroundContainer(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Recipe Image
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  recipe["image"],
                  width: double.infinity,
                  height: 250.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16.0),
        
              // Recipe Title
              Text(
                recipe["title"],
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
        
              // Ingredients Section
              Text(
                "Ingredients",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              ...recipe["ingredients"].map<Widget>((ingredient) {
                return Text("- $ingredient", style: TextStyle(fontSize: 16.0));
              }).toList(),
              SizedBox(height: 16.0),
        
              // Instructions Section
              Text(
                "Instructions",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                recipe["instructions"],
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}