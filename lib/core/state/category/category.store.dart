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

  @observable
  Category selectedCategory;

  @computed
  List<Category> get categories =>
      _categories == null ? null : _categories.categories;

  @action
  void setIsLoading(bool value) => isLoading = value;

  @action
  void setSelectedCategory(Category category) => selectedCategory = category;

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
