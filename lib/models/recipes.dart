class Recipe {
  final int id;
  final String title,
      creator,
      thumb,
      category,
      times,
      serving,
      ingredients,
      direction;
  final bool isSaved;

  Recipe({
    required this.id,
    required this.title,
    required this.creator,
    required this.thumb,
    required this.category,
    required this.times,
    required this.serving,
    required this.ingredients,
    required this.direction,
    required this.isSaved
  });

  factory Recipe.fromJSON(Map parsedJson) {
    return Recipe(
      id: parsedJson['id'],
      title: parsedJson['title'],
      creator: parsedJson['creator'],
      thumb: parsedJson['thumb'],
      category: parsedJson['category'],
      times: parsedJson['times'],
      serving: parsedJson['serving'],
      ingredients: parsedJson['ingredients'],
      direction: parsedJson['direction'],
      isSaved: parsedJson['isSaved']
    );
  }
}
