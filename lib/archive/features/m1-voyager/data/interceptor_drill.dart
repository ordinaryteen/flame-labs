import 'package:dio/dio.dart';

void main() async {
  final dio = Dio();

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        options.headers['Authorization'] = 'Bearer MY_SECRET_TOKEN';

        return handler.next(options);
      },
    ),
  );

  final response = await dio.get('https://httpbin.org/headers');

  print(response.data);
}
