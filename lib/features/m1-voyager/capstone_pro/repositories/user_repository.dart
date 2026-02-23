import 'dart:isolate';
import 'package:dio/dio.dart';
import '../models/user_profile.dart';
import '../network/api_client.dart';

// Top-level function for Core 2
List<UserProfile> _decodeUsersInBackground(List<dynamic> usersRawList) {
  print("\n[Core 2]: Decoding massive JSON string into Dart Objects...");
  // Simulate extreme parsing load
  for (int i = 0; i < 5000000; i++) {}

  return usersRawList.map((u) => UserProfile.fromJson(u)).toList();
}

class UserRepository {
  // A clean architecture repository needs an API Client to talk to the internet!
  final ApiClient apiClient;

  UserRepository(this.apiClient);

  Future<List<UserProfile>> fetchUsers() async {
    print("[Ops]: Initiating secure connection to Flame Labs Database...");
    try {
      final response = await apiClient.dio.get('https://dummyjson.com/users');

      if (response.statusCode == 200) {
        print("[Ops]: Connection established. Raw payload secured.");
        print("[Ops]: Spawning CPU Core 2 to deserialize payload...");

        List<dynamic> users = response.data['users'];

        // Spawn Core 2!
        return await Isolate.run(() => _decodeUsersInBackground(users));
      } else {
        throw Exception("Server exploded: ${response.statusCode}");
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 401) {
          throw Exception("CRITICAL: JWT Token Invalid or Missing!");
        }
      }
      throw Exception("Unknown error: $e");
    }
  }
}
