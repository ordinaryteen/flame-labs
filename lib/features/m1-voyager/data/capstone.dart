import 'dart:convert';
import 'package:dio/dio.dart';
import 'dart:isolate';

final String url = 'https://dummyjson.com/users';
final String secretToken = "FLAME_OVERRIDE_99X";

List<UserProfile> decodeUsers(String StringrawJson) {
  List users = StringrawJson;
  var listUser = users.map((u) => UserProfile.fromJson(u)).toList();

  for (int i = 1; i <= 10000000; i++) {}

  return listUser;
}

void main() async {
  final Dio dio = Dio();

  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handlers) {
    if (secretToken != null) {
      options.headers['Authorization'] = 'Bearer $secretToken';
    }
    return handlers.next(options);
  }));

  try {
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      List users = response.data['users'];
      // var listUser = decodeUsers(users);
      var listUser = await Isolate.run(() => decodeUsers(users));

      for (int i = 1; i <= 5; i++) {
        print("[CPU Core 1 - UI Thread]: Drawing Frame $i 🟢");
      }

      for (int i = 1; i <= 5; i++) {
        print(listUser[i].firstName);
      }
    } else {
      print("what the dawg doin ${response.statusCode}");
    }
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

class UserProfile {
  final int id;
  final String firstName;
  final Company company;

  UserProfile(
      {required this.id, required this.firstName, required this.company});

  factory UserProfile.fromJson(Map<String, dynamic> jsonMap) {
    return UserProfile(
        id: jsonMap['id'],
        firstName: jsonMap['firstName'],
        company: Company.fromJson(jsonMap['company']));
  }
}

class Company {
  final String name;
  final String title;

  Company({required this.name, required this.title});

  factory Company.fromJson(Map<String, dynamic> jsonMap) {
    return Company(name: jsonMap['name'], title: jsonMap['title']);
  }
}
