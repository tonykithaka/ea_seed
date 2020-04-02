class Recipe {
  final String name;
  final String publishedBy;
  final String uuid;
  final String photo;
  final String ingredients;
  final String instructions;
  final bool status;

  Recipe({
    this.name,
    this.publishedBy,
    this.uuid,
    this.photo,
    this.ingredients,
    this.instructions,
    this.status,
  });

  Recipe.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        publishedBy = json['publishedBy'],
        uuid = json['uuid'],
        photo = json['photo'],
        ingredients = json['ingredients'],
        instructions = json['instructions'],
        status = json['status'];
}
