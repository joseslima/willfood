// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoryStore on _CategoryStore, Store {
  Computed<List<Category>> _$categoriesComputed;

  @override
  List<Category> get categories =>
      (_$categoriesComputed ??= Computed<List<Category>>(() => super.categories,
              name: '_CategoryStore.categories'))
          .value;

  final _$_categoriesAtom = Atom(name: '_CategoryStore._categories');

  @override
  Categories get _categories {
    _$_categoriesAtom.reportRead();
    return super._categories;
  }

  @override
  set _categories(Categories value) {
    _$_categoriesAtom.reportWrite(value, super._categories, () {
      super._categories = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_CategoryStore.isLoading');

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

  final _$selectedCategoryAtom = Atom(name: '_CategoryStore.selectedCategory');

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

  final _$_CategoryStoreActionController =
      ActionController(name: '_CategoryStore');

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$_CategoryStoreActionController.startAction(
        name: '_CategoryStore.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_CategoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedCategory(Category category) {
    final _$actionInfo = _$_CategoryStoreActionController.startAction(
        name: '_CategoryStore.setSelectedCategory');
    try {
      return super.setSelectedCategory(category);
    } finally {
      _$_CategoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
selectedCategory: ${selectedCategory},
categories: ${categories}
    ''';
  }
}
