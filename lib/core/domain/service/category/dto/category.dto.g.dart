// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categories _$CategoriesFromJson(Map<String, dynamic> json) {
  return Categories(
    categories: (json['categories'] as List)
        .map((e) => Category.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    idCategory: json['idCategory'] as String,
    strCategory: json['strCategory'] as String,
    strCategoryDescription: json['strCategoryDescription'] as String,
    strCategoryThumb: json['strCategoryThumb'] as String,
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'idCategory': instance.idCategory,
      'strCategory': instance.strCategory,
      'strCategoryThumb': instance.strCategoryThumb,
      'strCategoryDescription': instance.strCategoryDescription,
    };
