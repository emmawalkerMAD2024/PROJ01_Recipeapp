import 'package:flutter/material.dart';
import 'package:p1_recipeapp_emmajared/pages/GroceryListPage.dart';
import '/main.dart';
import 'GroceryListPage.dart'; // Import the GroceryListPage

class RecipeDetailPage extends StatefulWidget {
  final Map<String, dynamic> recipe;

  const RecipeDetailPage({required this.recipe});

  @override
  _RecipeDetailPageState createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  late List<bool> _checkedIngredients;
  List<String> _groceryList = []; // List to hold grocery items

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
        builder: (context) => MyGroceryListPage(groceryList: _groceryList), // Correctly passing the grocery list
      ),
    );
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

              // Recipe Title
              Text(
                widget.recipe["title"],
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),

              // Ingredients Section
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

              // Instructions Section
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
    );
  }
}
