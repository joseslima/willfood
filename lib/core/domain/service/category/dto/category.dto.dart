import 'package:json_annotation/json_annotation.dart';

part 'category.dto.g.dart';

@JsonSerializable()
class Categories {
  @JsonKey(nullable: false)
  List<Category> categories;

  Categories({this.categories});

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesToJson(this);
}

@JsonSerializable()
class Category {
  String idCategory;
  String strCategory;
  String strCategoryThumb;
  String strCategoryDescription;

  Category(
      {this.idCategory,
      this.strCategory,
      this.strCategoryDescription,
      this.strCategoryThumb});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
