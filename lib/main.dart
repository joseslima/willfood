import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:willfood/initializer.dart';
import 'package:willfood/routes.dart';

import 'core/store/category/category.store.dart';

void main() {
  Initializer.init();

  final CategoryStore categoryStore = CategoryStore();

  initializeDateFormatting('pt_Br').then((_) => runApp(MyApp(
        categoryStore: categoryStore,
      )));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  final CategoryStore categoryStore;

  const MyApp({Key key, this.categoryStore}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    widget.categoryStore.getAllCateories();
    return MultiProvider(
      providers: [Provider<CategoryStore>(create: (_) => widget.categoryStore)],
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

