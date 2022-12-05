import 'package:cookuy/models/recipes.dart';
import 'package:cookuy/models/users.dart';
import 'package:dio/dio.dart';

class Service {
  static Future<List<Recipe>> fetchRecipes() async {
    Response response = await Dio().get("http://192.168.100.145:3000/recipes");
    List<Recipe> recipes =
        (response.data as List).map((v) => Recipe.fromJSON(v)).toList();
    return recipes;
  }

  static Future<List<Recipe>> fetchRecipesBasedCategory(String category) async {
    Response response = await Dio()
        .get("http://192.168.100.145:3000/recipes?category=" + category);
    List<Recipe> recipes =
        (response.data as List).map((v) => Recipe.fromJSON(v)).toList();
    return recipes;
  }

  static Future<List<User>> fetchUserBasedId(String id) async {
    Response response =
        await Dio().get("http://192.168.100.145:3000/users?id=" + id);
    List<User> users =
        (response.data as List).map((v) => User.fromJSON(v)).toList();
    return users;
  }

  static Future<List<Recipe>> fetchRecipesBasedBookmark() async {
    Response response = await Dio()
        .get("http://192.168.100.145:3000/recipes?isSaved=true");
    List<Recipe> recipes =
        (response.data as List).map((v) => Recipe.fromJSON(v)).toList();
    return recipes;
  }
}
