// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categories _$CategoriesFromJson(Map<String, dynamic> json) {
  return Categories(
    categories: (json['categories'] as List)
        ?.map((e) =>
            e == null ? null : Category.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      'categories': instance.categories?.map((e) => e?.toJson())?.toList(),
    };

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    id: json['id'] as int,
    name: json['name'] as String,
    subcategories: (json['subcategories'] as List)
        ?.map((e) =>
            e == null ? null : Subcategory.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'subcategories':
          instance.subcategories?.map((e) => e?.toJson())?.toList(),
    };

Subcategory _$SubcategoryFromJson(Map<String, dynamic> json) {
  return Subcategory(
    id: json['id'] as int,
    name: json['name'] as String,
    subsubcategories: (json['subsubcategories'] as List)
        ?.map((e) => e == null
            ? null
            : Subsubcategory.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SubcategoryToJson(Subcategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'subsubcategories':
          instance.subsubcategories?.map((e) => e?.toJson())?.toList(),
    };

Subsubcategory _$SubsubcategoryFromJson(Map<String, dynamic> json) {
  return Subsubcategory(
    id: json['id'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$SubsubcategoryToJson(Subsubcategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
