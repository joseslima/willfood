import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:willfood/core/domain/service/category/dto/category.dto.dart';
import 'package:willfood/core/domain/service/meal/dto/meal.dto.dart';
import 'package:willfood/core/state/category/category.store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:willfood/core/state/meal/meal.store.dart';
import 'package:willfood/presentation/widgets/category_image.widget.dart';
import 'package:willfood/presentation/widgets/category_item.widget.dart';

class CategoryScreen extends StatelessWidget {
  CategoryStore categoryStore;
  MealStore mealStore;
  Category category;

  Widget build(BuildContext context) {
    categoryStore = Provider.of<CategoryStore>(context);
    mealStore = Provider.of<MealStore>(context);

    category = categoryStore.selectedCategory;
    mealStore.getMealsByCategory(category.strCategory);

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Observer(
                builder: (_) {
                  return CategoryItem(
                    padding: EdgeInsets.all(0),
                    height: 230,
                    category: categoryStore.selectedCategory,
                    position: 0,
                    onTap: () => {
                      categoryStore
                          .setSelectedCategory(categoryStore.selectedCategory)
                    },
                  );
                },
              ),
              Observer(
                builder: (_) {
                  return mealStore.isLoading
                      ? Expanded(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : _mealList();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _mealList() {
    List<Meal> meals = this.mealStore.meals;
    int mealsLength = meals != null ? meals.length : 0;
    return Flexible(
      child: mealsLength > 0
          ? ListView.builder(
              itemCount: mealsLength,
              itemBuilder: (context, index) {
                Meal meal = meals[index];

                return Padding(
                  padding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
                  child: InkWell(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5)),
                              child: CachedNetworkImage(
                                fadeOutCurve: Curves.easeIn,
                                fit: BoxFit.cover,
                                imageUrl: meal.strMealThumb,
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Flexible(
                            child: Text(meal.strMeal,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Text("Não há categorias disponíveis =("),
            ),
    );
  }
}
