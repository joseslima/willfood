// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartStore on _CartStore, Store {
  final _$_mealsAtom = Atom(name: '_CartStore._meals');

  @override
  List<Meal> get _meals {
    _$_mealsAtom.reportRead();
    return super._meals;
  }

  @override
  set _meals(List<Meal> value) {
    _$_mealsAtom.reportWrite(value, super._meals, () {
      super._meals = value;
    });
  }

  final _$mealsCounterAtom = Atom(name: '_CartStore.mealsCounter');

  @override
  ObservableMap<String, int> get mealsCounter {
    _$mealsCounterAtom.reportRead();
    return super.mealsCounter;
  }

  @override
  set mealsCounter(ObservableMap<String, int> value) {
    _$mealsCounterAtom.reportWrite(value, super.mealsCounter, () {
      super.mealsCounter = value;
    });
  }

  final _$_CartStoreActionController = ActionController(name: '_CartStore');

  @override
  void addMealOnCart(Meal meal) {
    final _$actionInfo = _$_CartStoreActionController.startAction(
        name: '_CartStore.addMealOnCart');
    try {
      return super.addMealOnCart(meal);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeOneOfthisMealOfCart(Meal meal) {
    final _$actionInfo = _$_CartStoreActionController.startAction(
        name: '_CartStore.removeOneOfthisMealOfCart');
    try {
      return super.removeOneOfthisMealOfCart(meal);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeThisMealOfCart(Meal meal) {
    final _$actionInfo = _$_CartStoreActionController.startAction(
        name: '_CartStore.removeThisMealOfCart');
    try {
      return super.removeThisMealOfCart(meal);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cleanCart() {
    final _$actionInfo =
        _$_CartStoreActionController.startAction(name: '_CartStore.cleanCart');
    try {
      return super.cleanCart();
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mealsCounter: ${mealsCounter}
    ''';
  }
}
