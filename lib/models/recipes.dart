class Recipe {
  final int id;
  final String title,
      creator,
      description,
      thumb,
      category,
      times,
      serving,
      ingredients,
      direction;
  final bool isSaved, isPopular;

  Recipe(
      {required this.id,
      required this.title,
      required this.description,
      required this.creator,
      required this.thumb,
      required this.category,
      required this.times,
      required this.serving,
      required this.ingredients,
      required this.direction,
      required this.isPopular,
      required this.isSaved});

  factory Recipe.fromJSON(Map parsedJson) {
    return Recipe(
        id: parsedJson['id'],
        title: parsedJson['title'],
        description: parsedJson['description'],
        creator: parsedJson['creator'],
        thumb: parsedJson['thumb'],
        category: parsedJson['category'],
        times: parsedJson['times'],
        serving: parsedJson['serving'],
        ingredients: parsedJson['ingredients'],
        direction: parsedJson['direction'],
        isPopular: parsedJson['isPopular'],
        isSaved: parsedJson['isSaved']);
  }
}
