import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:willfood/core/domain/service/meal/dto/meal.dto.dart';

part 'meal.service.g.dart';

@RestApi()
abstract class MealService {
  factory MealService(Dio dio) = _MealService;

  @GET('/filter.php')
  Future<Meals> getMealsByCategory(
    @Query("c") String category,
  );
}
