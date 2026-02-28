import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;
  final String secretToken = "FLAME_OVERRIDE_99X";

  // Constructor runs immediately when someone creates an ApiClient
  ApiClient() : dio = Dio() {
    print("[Ops]: Booting Interceptor Toll Booth...");

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      print(
          "--> [Interceptor]: Stamping Authorization Header: Bearer $secretToken");
      options.headers['Authorization'] = 'Bearer $secretToken';
      return handler.next(options);
    }));
  }
}
