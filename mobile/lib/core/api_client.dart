import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;
  ApiClient(String baseUrl)
      : _dio = Dio(BaseOptions(baseUrl: baseUrl, connectTimeout: const Duration(seconds: 10)));

  Future<Response<dynamic>> getAppointments() => _dio.get('/appointments');

  Future<Response<dynamic>> createAppointment(Map<String, dynamic> body) =>
      _dio.post('/appointments', data: body);
}
