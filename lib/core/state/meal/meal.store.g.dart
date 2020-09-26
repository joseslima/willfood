// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MealStore on _MealStore, Store {
  Computed<List<Meal>> _$mealsComputed;

  @override
  List<Meal> get meals => (_$mealsComputed ??=
          Computed<List<Meal>>(() => super.meals, name: '_MealStore.meals'))
      .value;

  final _$_mealsAtom = Atom(name: '_MealStore._meals');

  @override
  Meals get _meals {
    _$_mealsAtom.reportRead();
    return super._meals;
  }

  @override
  set _meals(Meals value) {
    _$_mealsAtom.reportWrite(value, super._meals, () {
      super._meals = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_MealStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$selectedCategoryAtom = Atom(name: '_MealStore.selectedCategory');

  @override
  Category get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(Category value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  final _$_MealStoreActionController = ActionController(name: '_MealStore');

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$_MealStoreActionController.startAction(
        name: '_MealStore.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_MealStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedCategory(Category category) {
    final _$actionInfo = _$_MealStoreActionController.startAction(
        name: '_MealStore.setSelectedCategory');
    try {
      return super.setSelectedCategory(category);
    } finally {
      _$_MealStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
selectedCategory: ${selectedCategory},
meals: ${meals}
    ''';
  }
}
