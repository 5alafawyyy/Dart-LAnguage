import 'package:dio/dio.dart';

class ApiService {
  ApiService(this.dio);
  final Dio dio;

  final String _baseUrl = 'https://www.googleapis.com/books/v1/';

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    final response = await dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}
