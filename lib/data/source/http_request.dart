import 'package:dio/dio.dart';

abstract class HttpRequest {
  void dispose();
  Future<Map<String, dynamic>> get(String path,
      {Map<String, dynamic>? queryParameters,
      required Map<String, String> headers});
}

class DioRequest implements HttpRequest {
  final Dio _dioClient;

  DioRequest(this._dioClient);

  @override
  void dispose() {
    _dioClient.close();
  }

  @override
  Future<Map<String, dynamic>> get(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    final Response response = await _dioClient.get(path,
        queryParameters: queryParameters, options: Options(headers: headers));

    if (response.statusCode == null || response.statusCode! >= 300) {
      throw Exception('상태코드 ${response.statusCode}');
    }

    return response.data as Map<String, dynamic>;
  }
}
