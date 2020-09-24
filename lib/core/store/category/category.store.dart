import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:willfood/core/domain/service/category/category.service.dart';

part 'category.store.g.dart';

class CategoryStore = _CategoryStore with _$CategoryStore;

abstract class _CategoryStore with Store {
  final CategoryService categoryService = GetIt.I.get<CategoryService>();

  @observable
  Observable<String> value = Observable("Bola");

  Future<void> getAllCateories() async {
    try {
      var a = await this.categoryService.getCategories();
    } catch (e) {
      print(e);
    }
  }
}
