class Recipe {
  final String id;
  final String name;
  final List<String> imagesPath;
  final int? rate;
  final String? time;
  final int? makes;
  final String? level;
  final String? description;
  final List<String>? ingredients;
  final List<String>? direction;
  final String? video;
  final String? totalTime;
  final String? preparationTime;
  final String? cookingTime;

  Recipe({
    required this.id,
    required this.name,
    required this.imagesPath,
    this.rate,
    this.time,
    this.makes,
    this.level,
    this.description,
    this.ingredients,
    this.direction,
    this.video,
    this.totalTime,
    this.preparationTime,
    this.cookingTime,
  });
}
