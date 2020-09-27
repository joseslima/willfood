import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:willfood/initializer.dart';
import 'package:willfood/routes.dart';

import 'core/state/cart/cart.store.dart';
import 'core/state/category/category.store.dart';
import 'core/state/meal/meal.store.dart';

void main() {
  Initializer.init();

  final CategoryStore categoryStore = CategoryStore();
  final MealStore mealStore = MealStore();
  final CartStore cartStore = CartStore();

  initializeDateFormatting('pt_Br').then((_) => runApp(MyApp(
        categoryStore: categoryStore,
        mealStore: mealStore,
        cartStore: cartStore,
      )));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  final CategoryStore categoryStore;
  final MealStore mealStore;
  final CartStore cartStore;
  const MyApp({Key key, this.categoryStore, this.mealStore, this.cartStore})
      : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    widget.categoryStore.getAllCateories();

    List<SingleChildWidget> providers = [
      Provider<CategoryStore>(create: (_) => widget.categoryStore),
      Provider<MealStore>(create: (_) => widget.mealStore),
      Provider<CartStore>(create: (_) => widget.cartStore)
    ];

    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: appRoutes(),
      ),
    );
  }
}
