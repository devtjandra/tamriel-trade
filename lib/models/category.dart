import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable(explicitToJson: true)
class Categories {
  final List<Category> categories;

  Categories({this.categories});

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Category {
  final int id;
  final String name;
  final List<Subcategory> subcategories;

  Category({this.id, this.name, this.subcategories});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Subcategory {
  final int id;
  final String name;
  final List<Subsubcategory> subsubcategories;

  Subcategory({this.id, this.name, this.subsubcategories});

  factory Subcategory.fromJson(Map<String, dynamic> json) =>
      _$SubcategoryFromJson(json);
  Map<String, dynamic> toJson() => _$SubcategoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Subsubcategory {
  final int id;
  final String name;

  Subsubcategory({this.id, this.name});

  factory Subsubcategory.fromJson(Map<String, dynamic> json) =>
      _$SubsubcategoryFromJson(json);
  Map<String, dynamic> toJson() => _$SubsubcategoryToJson(this);
}