import 'package:flutter/material.dart';
import 'package:willfood/presentation/screens/category/category.screen.dart';
import 'package:willfood/presentation/screens/home/home.screen.dart';

Map<String, WidgetBuilder> appRoutes() => ({
      '/': (context) => HomeScreen(),
      '/category': (context) => CategoryScreen()
    });
