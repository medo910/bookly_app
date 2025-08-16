import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;
  ApiService(this._dio);

  Future<Map<String, dynamic>> get({
    required String endpoint,
    // Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await _dio.get(
        '$_baseUrl$endpoint',
        // queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception('Failed to fetch data: ${e.message}');
    }
  }
}
