class UserProfile {
  final int id;
  final String firstName;
  final Company company;

  UserProfile({
    required this.id,
    required this.firstName,
    required this.company,
  });

  factory UserProfile.fromJson(Map<String, dynamic> jsonMap) {
    return UserProfile(
      id: jsonMap['id'],
      firstName: jsonMap['firstName'],
      company: Company.fromJson(jsonMap['company']),
    );
  }
}

class Company {
  final String name;
  final String title;

  Company({required this.name, required this.title});

  factory Company.fromJson(Map<String, dynamic> jsonMap) {
    return Company(
      name: jsonMap['name'],
      title: jsonMap['title'],
    );
  }
}
