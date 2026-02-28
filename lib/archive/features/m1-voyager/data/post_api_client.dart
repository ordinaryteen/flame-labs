import 'dart:convert';
import 'package:http/http.dart' as http;

final String url = "https://jsonplaceholder.typicode.com/posts";

void main() async {
  final Uri jsonUri = Uri.parse(url);

  final Map<String, String> header = {
    'Content-Type': 'application/json; charset=UTF-8',
  };
  final String body = jsonEncode({
    "userId": 1,
    "title": "nesciunt quas odio",
    "body":
        "repudiandae veniam quaerat sunt sed\nalias aut fugiat sit autem sed est\nvoluptatem omnis possimus esse voluptatibus quis\nest aut tenetur dolor"
  });

  final response = await http.post(
    jsonUri,
    headers: header,
    body: body,
  );

  if (response.statusCode == 201) {
    final responseBody =
        PostModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>);

    print("--- DATABASE MUTATED SUCCESFULLY ---");
    print("Status: ${response.statusCode}");
    print("Server response: ${responseBody.body}");
  } else {
    print(response.statusCode);
  }
}

class PostModel {
  final int userId;
  final String title;
  final String body;

  const PostModel(
      {required this.userId, required this.title, required this.body});

  factory PostModel.fromJson(Map<String, dynamic> jsonMap) {
    return PostModel(
        userId: jsonMap['userId'],
        title: jsonMap['title'],
        body: jsonMap['body']);
  }
}
