import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:willfood/initializer.dart';
import 'package:willfood/routes.dart';

import 'core/state/category/category.store.dart';
import 'core/state/meal/meal.store.dart';

void main() {
  Initializer.init();

  final CategoryStore categoryStore = CategoryStore();
  final MealStore mealStore = MealStore();

  initializeDateFormatting('pt_Br').then((_) => runApp(MyApp(
        categoryStore: categoryStore,
        mealStore: mealStore,
      )));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  final CategoryStore categoryStore;
  final MealStore mealStore;
  const MyApp({Key key, this.categoryStore, this.mealStore}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    widget.categoryStore.getAllCateories();
    return MultiProvider(
      providers: [
        Provider<CategoryStore>(create: (_) => widget.categoryStore),
        Provider<MealStore>(create: (_) => widget.mealStore)
      ],
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
