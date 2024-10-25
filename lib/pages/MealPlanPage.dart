import 'package:flutter/material.dart';
import '/main.dart';

class MyMealPlanPage extends StatefulWidget {
  @override
  _MyMealPlanPageState createState() => _MyMealPlanPageState();
}

class _MyMealPlanPageState extends State<MyMealPlanPage> {
  Map<String, dynamic>? selectedRecipe;

  final Map<String, Map<String, dynamic>?> mealPlan = {
    "Monday Breakfast": null,
    "Monday Lunch": null,
    "Monday Dinner": null,
    "Tuesday Breakfast": null,
    "Tuesday Lunch": null,
    "Tuesday Dinner": null,
    "Wednesday Breakfast": null,
    "Wednesday Lunch": null,
    "Wednesday Dinner": null,
    "Thursday Breakfast": null,
    "Thursday Lunch": null,
    "Thursday Dinner": null,
    "Friday Breakfast": null,
    "Friday Lunch": null,
    "Friday Dinner": null,
    "Saturday Breakfast": null,
    "Saturday Lunch": null,
    "Saturday Dinner": null,
    "Sunday Breakfast": null,
    "Sunday Lunch": null,
    "Sunday Dinner": null,
  };

  @override
  Widget build(BuildContext context) {
    final recipes = MealPlan().recipes;

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
        child: Column(
          children: [
            recipes.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "To add a recipe to your Meal Plan, navigate to the desired recipe and click the 'Add to Meal Plan' calendar icon.",
                        style: darkGreenTextStyle(),
                      ),
                    ),
                  )
                : SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: recipes.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => _selectMealSlot(context, recipes[index]),
                          child: Container(
                            width: 100,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    recipes[index]["image"],
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  recipes[index]["title"],
                                  style: TextStyle(fontSize: 12),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
            SizedBox(height: 20),

            Text(
              "Your Weekly FlavorFit Meal Planner!\nChoose the desired recipe, select the corresponding meal slot, and plan out your week today!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            Expanded(
              child: ListView(
                children: [
                  _buildDayMealSlots("Monday"),
                  _buildDayMealSlots("Tuesday"),
                  _buildDayMealSlots("Wednesday"),
                  _buildDayMealSlots("Thursday"),
                  _buildDayMealSlots("Friday"),
                  _buildDayMealSlots("Saturday"),
                  _buildDayMealSlots("Sunday"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDayMealSlots(String day) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            "$day",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        _buildMealSlot("$day Breakfast"),
        _buildMealSlot("$day Lunch"),
        _buildMealSlot("$day Dinner"),
      ],
    );
  }

  Widget _buildMealSlot(String mealType) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(
          mealPlan[mealType] == null
              ? 'Select a recipe for $mealType'
              : mealPlan[mealType]!["title"],
          style: TextStyle(fontSize: 18),
        ),
        leading: mealPlan[mealType] == null
            ? Icon(Icons.fastfood)
            : Image.asset(
                mealPlan[mealType]!["image"],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
        onTap: () => _selectMealSlotForDay(context, mealType),
      ),
    );
  }

  void _selectMealSlotForDay(BuildContext context, String mealType) {
    if (selectedRecipe != null) {
      setState(() {
        mealPlan[mealType] = selectedRecipe;
      });
      selectedRecipe = null;
    }
  }

  void _selectMealSlot(BuildContext context, Map<String, dynamic> recipe) {
    setState(() {
      selectedRecipe = recipe;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Select a meal slot to add '${recipe["title"]}'"),
      ),
    );
  }
}
