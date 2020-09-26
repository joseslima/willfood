import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:willfood/core/domain/service/category/dto/category.dto.dart';
import 'package:willfood/core/store/category/category.store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:willfood/presentation/screens/home/widgets/category_image.dart';

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
                print(category.strCategoryThumb);
                return CategoryItem(category: category, position: index);
              },
            )
          : Center(
              child: Text("Não há categorias disponíveis =("),
            ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {Key key, @required this.category, @required this.position})
      : super(key: key);

  final int position;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: position == 0
            ? EdgeInsets.all(20)
            : EdgeInsets.only(bottom: 20, right: 20, left: 20),
        child: InkWell(
          onTap: () => {},
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.black12),
            ),
            child: Stack(
              children: [
                CategoryImage(
                  secondGradientColor: Colors.black87,
                  height: 180.0,
                  url: category.strCategoryThumb,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(10.0),
                  ),
                ),
                Positioned(
                  bottom: 20.0,
                  left: 20.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 40,
                        child: Text(
                          category.strCategory,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
