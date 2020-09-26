import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:willfood/core/domain/service/category/dto/category.dto.dart';
import 'package:willfood/core/domain/service/meal/dto/meal.dto.dart';
import 'package:willfood/core/domain/service/meal/meal.service.dart';

part 'meal.store.g.dart';

class MealStore = _MealStore with _$MealStore;

abstract class _MealStore with Store {
  final MealService mealService = GetIt.I.get<MealService>();

  @observable
  Meals _meals;

  @observable
  bool isLoading = false;

  @observable
  Category selectedCategory;

  @computed
  List<Meal> get meals => _meals == null ? null : _meals.meals;

  @action
  void setIsLoading(bool value) => isLoading = value;

  @action
  void setSelectedCategory(Category category) => selectedCategory = category;

  Future<void> getMealsByCategory(String category) async {
    try {
      setIsLoading(true);
      this._meals = await this.mealService.getMealsByCategory(category);
      setIsLoading(false);
    } catch (e) {
      print(e);
    }
  }
}
