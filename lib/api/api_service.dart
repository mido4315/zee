import 'package:dio/dio.dart';

class APIService {
  APIService(this._dio);

  final Map<String, dynamic> _headers = {
    'Content-Type': 'application/json',
    'Vary': 'Accept',
  };
  final _baseUrl = 'https://web-production-df187.up.railway.app/erd/Register/';
  final Dio _dio;

  Future<Map<String, dynamic>> post({
    Map<String, dynamic>? headers,
    required String path,
    String? data,
  }) async {
    Response response = await _dio.post(
      '$_baseUrl',
      options: Options(
        headers: _headers,
      ),
      data: data ?? '{"example_key": "example_value"}',
    );
    print("Status code : ${response.statusCode}");
    return response.data;
  }
}

// import 'package:dio/dio.dart';
//
// class APIService {
//   APIService(this._dio);
//   final Map<String, dynamic> _headers = {
//   'Content-type': 'application/json; charset=UTF-8',
//     'Vary': 'Accept',
//     'Accept':'application/json'
//   };
//   final _baseUrl = 'https://web-production-df187.up.railway.app/erd/Register';
//   final Dio _dio;
//
//
//   Future<Map<String, dynamic>> post({
//     Map<String, dynamic>? headers,
//     required String path,
//     String? data,
//   }) async {
//     Response response = await _dio.post(
//       '$_baseUrl',
//       options: Options(
//         headers: headers ?? _headers,
//         followRedirects: false,
//       ),
//       data: data,
//     );
//     return response.data;
//   }
// }