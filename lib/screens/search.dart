import 'package:cookuy/constants.dart';
import 'package:cookuy/models/recipes.dart';
import 'package:cookuy/screens/components/home_body.dart';
import 'package:cookuy/services/services.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Recipe> _recipe = [];
  List<Recipe> _recipeDisplay = [];

  bool isLoading = true;

  @override
  void initState() {
    Service.fetchRecipes().then((value) {
      setState(() {
        isLoading = false;
        _recipe.addAll(value);
        _recipeDisplay = _recipe;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        title: Text(
          "Search",
          style: TextStyle(
              fontFamily: 'OpenSans-Bold', color: semiBlack, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (!isLoading) {
                    return index == 0 ? _searchBar() : _listItem(index - 1);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
                itemCount: _recipeDisplay.length + 1,
              )
            ],
          ),
        ),
      ),
    );
  }

  _listItem(index) {
    return RecipeCard(
        imageUrl: _recipeDisplay[index].thumb,
        title: _recipeDisplay[index].title,
        est: _recipeDisplay[index].times);
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25, top: 10),
      child: Container(
        child: TextFormField(
          onChanged: (text) {
            text = text.toLowerCase();
            setState(() {
              _recipeDisplay = _recipe.where((recipe) {
                var recipeTitle = recipe.title.toLowerCase();
                return recipeTitle.contains(text);
              }).toList();
            });
          },
          decoration: InputDecoration(
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: extraLightGrey)),
            fillColor: extraLightGrey,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: extraLightGrey, width: 3)),
            hintText: 'Search for recipes',
            hintStyle: TextStyle(
                fontFamily: 'OpenSans-Light', color: lightGrey, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
