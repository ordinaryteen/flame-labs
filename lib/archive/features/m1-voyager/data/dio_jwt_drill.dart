import 'package:dio/dio.dart';

void main() async {
  final dio = Dio();

  String? jwtToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpCJ9";

  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
    if (jwtToken != null) {
      options.headers['Authorization'] = 'Bearer $jwtToken';
    }
    return handler.next(options);
  }));

  try {
    final response = await dio.get('https://httpbin.org/bearer');
    print("Vault opened! Server says: ${response.data}");
    print("Status: ${response.statusCode}");
  } catch (e) {
    if (e is DioException) {
      if (e.response?.statusCode == 401) {
        print(
            "CRITICAL: JWT Token Invalid or Missing! Booting user to Login Screen.");
      } else {
        print("Other DioError: $e");
      }
    } else {
      print("Unknown Error: $e");
    }
  }
}
