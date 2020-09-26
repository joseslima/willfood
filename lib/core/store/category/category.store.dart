import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:willfood/core/domain/service/category/category.service.dart';
import 'package:willfood/core/domain/service/category/dto/category.dto.dart';

part 'category.store.g.dart';

class CategoryStore = _CategoryStore with _$CategoryStore;

abstract class _CategoryStore with Store {
  final CategoryService categoryService = GetIt.I.get<CategoryService>();

  @observable
  Categories _categories;

  @observable
  bool isLoading = false;

  @computed
  List<Category> get categories {
    if (_categories == null){
      return null;
    }
    return _categories.categories;
  } 

  @action
  void setIsLoading(bool value) => isLoading = value;
  
  Future<void> getAllCateories() async {
    try {
      setIsLoading(true);
      this._categories = await this.categoryService.getCategories();
      setIsLoading(false);
    } catch (e) {
      print(e);
    }
  }
}
