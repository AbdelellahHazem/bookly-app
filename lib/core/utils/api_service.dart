import 'package:dio/dio.dart';

class ApiService {
  final baseurl = 'https://www.googleapis.com/books/v1/';
  final key = 'AIzaSyCSGjDniZy03Oq2FgbNDjSL9PgJrM6tDQ8';

  Dio dio;

  ApiService(this.dio);

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    final delimiter = endpoint.contains('?') ? '&' : '?';
    final url = '$baseurl$endpoint${delimiter}key=$key';

    // debug: print the full URL being requested
    print('ApiService.get -> url: $url');

    final response = await dio.get(url);

    // debug: print status and the raw response data
    print('ApiService.get -> statusCode: ${response.statusCode}');
    print('ApiService.get -> response.data: ${response.data}');

    if (response.data is Map<String, dynamic>)
      return response.data as Map<String, dynamic>;
    return Map<String, dynamic>.from(response.data);
  }
}
