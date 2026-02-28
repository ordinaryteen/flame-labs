import 'dart:convert';

final String rawJson = '{"id":42, "name":"Nafi"}';

final String rawIdentity = '''{
  "id": 99,
  "name": "Nafi",
  "company": {
    "name": "Flame Labs",
    "catchPhrase": "Building deep tech"
  }
}''';

void main() async {
  final json = jsonDecode(rawIdentity);
  final myIdentity = User.fromJson(json as Map<String, dynamic>);

  print("User's name is: ${myIdentity.company.name}");
}

class User {
  final int id;
  final String name;
  final Company company;

  User({required this.id, required this.name, required this.company});

  factory User.fromJson(Map<String, dynamic> jsonMap) {
    return User(
        id: jsonMap['id'],
        name: jsonMap['name'],
        company: Company.fromJson(jsonMap['company']));
  }
}

class Company {
  final String name;
  final String? catchPhrase; // optional

  Company({required this.name, this.catchPhrase});

  factory Company.fromJson(Map<String, dynamic> companyJson) {
    return Company(
        name: companyJson['name'], catchPhrase: companyJson['catchPhrase']);
  }
}
