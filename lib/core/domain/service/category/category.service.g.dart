// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _CategoryService implements CategoryService {
  _CategoryService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  getCategories() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/categories.php',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Categories.fromJson(_result.data);
    return value;
  }
}
