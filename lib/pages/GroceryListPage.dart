import 'package:flutter/material.dart';
import '/main.dart';

class MyGroceryListPage extends StatefulWidget {
  final List<String> groceryList;

  const MyGroceryListPage({Key? key, required this.groceryList}) : super(key: key);

  @override
  _MyGroceryListPageState createState() => _MyGroceryListPageState();
}

class _MyGroceryListPageState extends State<MyGroceryListPage> {
  late List<bool> _checkedItems;

  @override
  void initState() {
    super.initState();
    _checkedItems = List<bool>.filled(widget.groceryList.length, false);
  }

  void _toggleCheckbox(int index) {
    setState(() {
      _checkedItems[index] = !_checkedItems[index];
    });
  }

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
        child: widget.groceryList.isEmpty
            ? Center(
                child: Text(
                  "Your grocery list is empty.",
                  style: darkGreenTextStyle(),
                ),
              )
            : ListView.builder(
                itemCount: widget.groceryList.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: _checkedItems[index],
                        onChanged: (bool? value) {
                          _toggleCheckbox(index);
                        },
                      ),
                      Expanded(
                        child: Text(
                          widget.groceryList[index],
                          style: TextStyle(
                            decoration: _checkedItems[index] ? TextDecoration.lineThrough : null,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
