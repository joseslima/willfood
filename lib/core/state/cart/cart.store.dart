import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:willfood/core/domain/service/category/dto/category.dto.dart';
import 'package:willfood/core/domain/service/meal/dto/meal.dto.dart';
import 'package:willfood/core/domain/service/meal/meal.service.dart';

part 'cart.store.g.dart';

class CartStore = _CartStore with _$CartStore;

abstract class _CartStore with Store {
  @observable
  List<Meal> _meals = [];

  @observable
  ObservableMap<String, int> mealsCounter = ObservableMap.of({});

  @action
  void addMealOnCart(Meal meal) {
    print("OKE");
    String idMeal = meal.idMeal;
    if (mealsCounter.containsKey(idMeal)) {
      mealsCounter[idMeal] += 1;
    } else {
      _meals.add(meal);
      mealsCounter[idMeal] = 0;
    }
  }

  @action
  void removeOneOfthisMealOfCart(Meal meal) {
    String idMeal = meal.idMeal;
    if (mealsCounter.containsKey(idMeal)) {
      if (mealsCounter[idMeal] > 1) {
        mealsCounter[idMeal] -= 1;
      } else {
        mealsCounter.remove(idMeal);
        _meals.removeWhere((element) => element.idMeal == idMeal);
      }
    }
  }

  @action
  void removeThisMealOfCart(Meal meal) {
    String id = meal.idMeal;
    if (mealsCounter.containsKey(id)) {
      mealsCounter.remove(id);
      _meals.removeWhere((element) => element.idMeal == id);
    }
  }

  @action
  void cleanCart() {
    print("opa");
    _meals.clear();
    mealsCounter.clear();
  }

  int getCountOfThisMealonCart(Meal meal) {
    String idMeal = meal.idMeal;
    return mealsCounter.containsKey(idMeal) ? mealsCounter[idMeal] : 0;
  }
}
