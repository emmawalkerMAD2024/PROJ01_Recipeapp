import 'package:flutter/material.dart';
import '/main.dart';
import 'RecipeDetailPage.dart'; 

class MyMealPlanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mealPlan = MealPlan(); 
    final recipes = mealPlan.recipes; 

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
        child: recipes.isEmpty
            ? Center(
                child: Text(
                  "To add a recipe to your Meal Plan, click the 'Add to Meal Plan' icon on the recipe you'd like to add.",
                  style: darkGreenTextStyle(),
                ),
              )
            : ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeDetailPage(recipe: recipes[index]),
                        ),
                      );
                    },
                    child: ListTile(
                      title: MouseRegion(
                        onEnter: (_) => _showHoverEffect(context, true, index),
                        onExit: (_) => _showHoverEffect(context, false, index),
                        child: Text(
                          recipes[index]["title"],
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: _hoveredIndex == index ? Colors.blue : Colors.black, 
                          ),
                        ),
                      ),
                      subtitle: Text(recipes[index]["instructions"]),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          recipes[index]["image"],
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  int? _hoveredIndex;

  void _showHoverEffect(BuildContext context, bool isHovered, int index) {
    _hoveredIndex = isHovered ? index : null;
    (context as Element).markNeedsBuild();
  }
}
