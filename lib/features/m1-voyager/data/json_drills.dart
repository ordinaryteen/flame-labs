import 'dart:convert';

final String rawJson = '{"id":42, "name":"Nafi"}';

void main() async {
  final json = jsonDecode(rawJson);
  final myUser = User.fromJson(json as Map<String, dynamic>);

  print("User's name is: ${myUser.name}");
}

class User {
  final int id;
  final String name;
  final bool? isActive; // optional

  User({required this.id, required this.name, this.isActive});

  factory User.fromJson(Map<String, dynamic> jsonMap) {
    return User(
        id: jsonMap['id'],
        name: jsonMap['name'],
        isActive: jsonMap['isActive']);
  }
}
