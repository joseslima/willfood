// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _MealService implements MealService {
  _MealService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  getMealsByCategory(category) async {
    ArgumentError.checkNotNull(category, 'category');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'c': category};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/filter.php',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Meals.fromJson(_result.data);
    return value;
  }
}
