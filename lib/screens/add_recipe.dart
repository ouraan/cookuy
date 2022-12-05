import 'package:cookuy/constants.dart';
import 'package:cookuy/models/users.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AddRecipe extends StatefulWidget {
  final User user;
  const AddRecipe({super.key, required this.user});

  @override
  State<AddRecipe> createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerDesc = TextEditingController();
  TextEditingController controllerCat = TextEditingController();
  TextEditingController controllerIngredients = TextEditingController();
  TextEditingController controllerDirection = TextEditingController();
  TextEditingController controllerTimes = TextEditingController();
  TextEditingController controllerServing = TextEditingController();
  TextEditingController controllerCover = TextEditingController();
  TextEditingController controllerCreator = TextEditingController();

  @override
  void initState() {
    controllerCreator.text = widget.user.name;
    super.initState();
  }

  void add(String title, creator, thumb, category, times, serving, ingredients,
      direction, isSaved) async {
    try {
      var response =
          await Dio().post('http://192.168.100.145:3000/recipes', data: {
        "title": title,
        "creator": creator,
        "thumb": thumb,
        "category": category,
        "times": times,
        "serving": serving,
        "ingredients": ingredients,
        "direction": direction,
        "isSaved": isSaved as bool
      });
      if (response.data.length > 0) {
        print("Recipe added successfully");
      } else {
        print("Failed");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        title: Text(
          "Add",
          style: TextStyle(
              fontFamily: 'OpenSans-Bold', color: semiBlack, fontSize: 18),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Icon(
              Icons.keyboard_arrow_left,
              color: semiBlack,
              size: 30,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add Recipe",
                style: TextStyle(
                    fontFamily: 'OpenSans-Bold',
                    color: semiBlack,
                    fontSize: 24),
              ),
              SizedBox(height: 10),
              Text(
                "Create your own recipe",
                style: TextStyle(
                    fontFamily: 'OpenSans-Regular',
                    color: darkGrey,
                    fontSize: 16),
              ),
              SizedBox(height: 30),
              Text(
                "Title",
                style: TextStyle(
                    fontFamily: 'OpenSans-Bold',
                    color: semiBlack,
                    fontSize: 16),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: controllerTitle,
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: extraLightGrey)),
                  fillColor: extraLightGrey,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: extraLightGrey, width: 3)),
                  hintText: 'Your recipe title',
                  hintStyle: TextStyle(
                      fontFamily: 'OpenSans-Light',
                      color: lightGrey,
                      fontSize: 16),
                ),
              ),
              SizedBox(height: 18),
              Text(
                "Description",
                style: TextStyle(
                    fontFamily: 'OpenSans-Bold',
                    color: semiBlack,
                    fontSize: 16),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: controllerDesc,
                maxLines: 5,
                minLines: 3,
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: extraLightGrey)),
                  fillColor: extraLightGrey,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: extraLightGrey, width: 3)),
                  hintText: 'Give a brief description about you recipe',
                  hintStyle: TextStyle(
                      fontFamily: 'OpenSans-Light',
                      color: lightGrey,
                      fontSize: 16),
                ),
              ),
              SizedBox(height: 18),
              Text(
                "Category",
                style: TextStyle(
                    fontFamily: 'OpenSans-Bold',
                    color: semiBlack,
                    fontSize: 16),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: controllerCat,
                maxLines: 5,
                minLines: 3,
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: extraLightGrey)),
                  fillColor: extraLightGrey,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: extraLightGrey, width: 3)),
                  hintText: 'Fried, Soup, Drink, Cake',
                  hintStyle: TextStyle(
                      fontFamily: 'OpenSans-Light',
                      color: lightGrey,
                      fontSize: 16),
                ),
              ),
              SizedBox(height: 18),
              Text(
                "Ingredients",
                style: TextStyle(
                    fontFamily: 'OpenSans-Bold',
                    color: semiBlack,
                    fontSize: 16),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: controllerIngredients,
                maxLines: 7,
                minLines: 5,
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: extraLightGrey)),
                  fillColor: extraLightGrey,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: extraLightGrey, width: 3)),
                  hintText: 'Write the ingredients',
                  hintStyle: TextStyle(
                      fontFamily: 'OpenSans-Light',
                      color: lightGrey,
                      fontSize: 16),
                ),
              ),
              SizedBox(height: 18),
              Text(
                "Direction",
                style: TextStyle(
                    fontFamily: 'OpenSans-Bold',
                    color: semiBlack,
                    fontSize: 16),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: controllerDirection,
                maxLines: 7,
                minLines: 5,
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: extraLightGrey)),
                  fillColor: extraLightGrey,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: extraLightGrey, width: 3)),
                  hintText: 'Write the directions',
                  hintStyle: TextStyle(
                      fontFamily: 'OpenSans-Light',
                      color: lightGrey,
                      fontSize: 16),
                ),
              ),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 175,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Times",
                          style: TextStyle(
                              fontFamily: 'OpenSans-Bold',
                              color: semiBlack,
                              fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: controllerTimes,
                          decoration: InputDecoration(
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: extraLightGrey)),
                            fillColor: extraLightGrey,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: extraLightGrey, width: 3)),
                            hintText: 'Your times',
                            hintStyle: TextStyle(
                                fontFamily: 'OpenSans-Light',
                                color: lightGrey,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 175,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Serving",
                          style: TextStyle(
                              fontFamily: 'OpenSans-Bold',
                              color: semiBlack,
                              fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: controllerServing,
                          decoration: InputDecoration(
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: extraLightGrey)),
                            fillColor: extraLightGrey,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: extraLightGrey, width: 3)),
                            hintText: 'Your serving',
                            hintStyle: TextStyle(
                                fontFamily: 'OpenSans-Light',
                                color: lightGrey,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 18),
              Text(
                "Cover URL",
                style: TextStyle(
                    fontFamily: 'OpenSans-Bold',
                    color: semiBlack,
                    fontSize: 16),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: controllerCover,
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: extraLightGrey)),
                  fillColor: extraLightGrey,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: extraLightGrey, width: 3)),
                  hintText: 'http://images.jpg',
                  hintStyle: TextStyle(
                      fontFamily: 'OpenSans-Light',
                      color: lightGrey,
                      fontSize: 16),
                ),
              ),
              SizedBox(height: 18),
              Text(
                "Creator",
                style: TextStyle(
                    fontFamily: 'OpenSans-Bold',
                    color: semiBlack,
                    fontSize: 16),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: controllerCreator,
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: extraLightGrey)),
                  fillColor: extraLightGrey,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: extraLightGrey, width: 3)),
                  hintText: 'Your name',
                  hintStyle: TextStyle(
                      fontFamily: 'OpenSans-Light',
                      color: lightGrey,
                      fontSize: 16),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  add(
                      controllerTitle.text,
                      controllerCreator.text,
                      controllerCover.text,
                      controllerCat.text,
                      controllerTimes.text,
                      controllerServing.text,
                      controllerIngredients.text,
                      controllerDirection.text,
                      false);
                },
                child: Text(
                  "Add",
                  style: TextStyle(
                      fontFamily: 'OpenSans-SemiBold',
                      color: white,
                      fontSize: 15),
                ),
                style: ElevatedButton.styleFrom(
                    primary: lightGreen,
                    elevation: 0,
                    minimumSize: const Size.fromHeight(53),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
