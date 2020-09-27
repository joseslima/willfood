import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:willfood/core/domain/service/category/dto/category.dto.dart';

part 'category.service.g.dart';

@RestApi()
abstract class CategoryService {
  factory CategoryService(Dio dio) = _CategoryService;

  @GET('/categories.php')
  Future<Categories> getCategories();
}
