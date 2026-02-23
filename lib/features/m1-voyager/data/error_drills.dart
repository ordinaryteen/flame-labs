import 'package:http/http.dart' as http;
import 'dart:convert';

final String url = 'https://this-website-does-not-exist.com';
// final String url = 'https://jsonplaceholder.typicode.com/posts?id=100'; // what exactly i need to do to filter it?

final Uri parseUrl = Uri.parse(url);

void main() async {
  try {
    final res = await http.get(parseUrl);

    print(jsonDecode(res.body));
  } catch (e) {
    print("The error was $e");
  }
}
