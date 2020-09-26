import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:willfood/core/domain/service/category/dto/category.dto.dart';
import 'package:willfood/core/state/category/category.store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:willfood/presentation/widgets/category_image.widget.dart';
import 'package:willfood/presentation/widgets/category_item.widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryStore categoryStore;

  @override
  Widget build(BuildContext context) {
    categoryStore = Provider.of<CategoryStore>(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black12),
                  ),
                ),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "WillFood",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ),
              Observer(
                builder: (_) {
                  return categoryStore.isLoading
                      ? Expanded(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : _categoryList();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryList() {
    List<Category> categories = this.categoryStore.categories;
    int cateoriesLength = categories != null ? categories.length : 0;
    return Flexible(
      child: cateoriesLength > 0
          ? ListView.builder(
              itemCount: cateoriesLength,
              itemBuilder: (context, index) {
                Category category = categories[index];

                EdgeInsets padding = index == 0 ? EdgeInsets.all(20) :EdgeInsets.only(bottom: 20, left: 20, right: 20);
                return CategoryItem(
                  category: category,
                  position: index,
                  padding: padding,
                  onTap: () {
                    categoryStore.setSelectedCategory(category);
                    Navigator.of(context).pushNamed('/category');
                  },
                );
              },
            )
          : Center(
              child: Text("Não há categorias disponíveis =("),
            ),
    );
  }
}
