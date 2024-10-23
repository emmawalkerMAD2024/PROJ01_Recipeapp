import 'package:flutter/material.dart';
import 'package:p1_recipeapp_emmajared/pages/GroceryListPage.dart';
import '/main.dart';

class RecipeDetailPage extends StatefulWidget {
  final Map<String, dynamic> recipe;

  const RecipeDetailPage({required this.recipe});

  @override
  _RecipeDetailPageState createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  late List<bool> _checkedIngredients;
  List<String> _groceryList = []; 

  @override
  void initState() {
    super.initState();
    _checkedIngredients = List<bool>.filled(widget.recipe["ingredients"].length, false);
  }

  void _toggleCheckbox(int index) {
    setState(() {
      _checkedIngredients[index] = !_checkedIngredients[index];
    });
  }

  void _addToGroceryList(String ingredient) {
    if (!_groceryList.contains(ingredient)) {
      setState(() {
        _groceryList.add(ingredient);
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('$ingredient added to Grocery List'),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('$ingredient is already in the Grocery List'),
      ));
    }
  }

  void _viewGroceryList() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyGroceryListPage(groceryList: _groceryList),
      ),
    );
  }

  void _addToMealPlan() {
    final mealPlan = MealPlan();
    mealPlan.recipes.add(widget.recipe); // Add the recipe to the meal plan

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('${widget.recipe["title"]} added to Meal Plan!'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe["title"], style: darkGreenTextStyle()),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _viewGroceryList,
            tooltip: 'View Grocery List',
          ),
        ],
      ),
      body: backgroundContainer(
        child: SingleChildScrollView( // Wrap the content in a SingleChildScrollView
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Recipe Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    widget.recipe["image"],
                    width: double.infinity,
                    height: 250.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16.0),

                // Row for title and planner icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.recipe["title"],
                        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.calendar_today), // Planner icon
                      onPressed: _addToMealPlan,
                      tooltip: 'Add to Meal Plan',
                    ),
                  ],
                ),
                SizedBox(height: 16.0),

                Text(
                  "Ingredients",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.recipe["ingredients"].length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Checkbox(
                          value: _checkedIngredients[index],
                          onChanged: (bool? value) {
                            _toggleCheckbox(index);
                          },
                        ),
                        Expanded(
                          child: Text(
                            widget.recipe["ingredients"][index],
                            style: TextStyle(
                              fontSize: 16.0,
                              decoration: _checkedIngredients[index] ? TextDecoration.lineThrough : null,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.add_shopping_cart),
                          onPressed: () {
                            _addToGroceryList(widget.recipe["ingredients"][index]);
                          },
                          tooltip: 'Add to Grocery List',
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 16.0),

                Text(
                  "Instructions",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  widget.recipe["instructions"],
                  style: TextStyle(fontSize: 16.0), 
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
