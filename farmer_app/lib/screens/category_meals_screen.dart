import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../widgets/meal_item.dart';
import '../dummy_data.dart';
// import '../dummy_data_short_life.dart' as second;

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  CategoryMealsScreen();


  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  final nameController = TextEditingController();
  int totalQuantity = 1010;

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.rr,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return MealItem(
                  retailPrice: categoryMeals[index].retailPrice,
                  id: categoryMeals[index].id,
                  title: categoryMeals[index].title,
                  imageUrl: categoryMeals[index].imageUrl,
                  duration: categoryMeals[index].duration,
                  affordability: categoryMeals[index].affordability,
                  complexity: categoryMeals[index].complexity,
                );
              },
              itemCount: categoryMeals.length,
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Container(
              height: (MediaQuery.of(context).size.height - 5) * 0.38,
              child: Card(
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 125,
                            width: MediaQuery.of(context).size.width * 0.35,
                            margin: EdgeInsets.all(5),
                            child: Card(
                              color: Colors.lightGreen,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "RETAIL PRICE",
                                      style: TextStyle(
                                          fontFamily: "Roboto", fontSize: 15),
                                    ),
                                    Text(
                                      "Rs.35",
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Container(
                            height: 125,
                            width: MediaQuery.of(context).size.width * 0.55,
                            margin: EdgeInsets.all(5),
                            child: Card(
                              color: Colors.green,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "AVAILABLE QUANTITY",
                                      style: TextStyle(
                                          fontFamily: "Roboto", fontSize: 15),
                                    ),
                                    Text(
                                      "$totalQuantity Kg",
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Enter Quantity (in Kg)',
                        ),
                        style: Theme.of(context).textTheme.title,
                        controller: nameController,
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => nameController.text.isNotEmpty
                          ? showToast(
                              "Database Updated",
                              nameController,
                              gravity: Toast.CENTER,
                            )
                          : showToast("Enter Quantity", nameController,
                              gravity: Toast.BOTTOM),
                      child: Text("ADD"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showToast(String msg, TextEditingController controller,
      {int duration, int gravity}) {
    setState(() {
      totalQuantity += int.parse(controller.text);
    });
    controller.clear();
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}
