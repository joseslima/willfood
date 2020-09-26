import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:willfood/config.dart';
import 'package:logger/logger.dart';

import 'core/domain/service/category/category.service.dart';
import 'core/domain/service/meal/meal.service.dart';

class Initializer {
  static Future<void> init() async {
    _initDio();
    _initServices();
  }

  static void _initDio() async {
    var dio = Dio();
    var url = ConfigEnvironments.getEnvironments()['url'];
    dio.options.baseUrl = url;
    dio.options.sendTimeout = 10000;
    Logger().i('Dio conectado em: $url');
    GetIt.I.registerSingleton<Dio>(dio);
  }

  static void _initServices() {
    GetIt getIt = GetIt.I;
    Dio dio = getIt.get<Dio>();

    CategoryService categoryService = CategoryService(dio);
    MealService mealService = MealService(dio);

    getIt.registerSingleton<CategoryService>(categoryService);
    getIt.registerSingleton<MealService>(mealService);
  }
}
