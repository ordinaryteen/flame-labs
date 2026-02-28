import 'dart:convert';
import 'package:http/http.dart' as http;

void getUser() async {
  final String url = 'https://jsonplaceholder.typicode.com/users/3';

  try {
    final biodataRaw = await http.get(headers: {
      'User-Agent': 'Dart/3.0 (dart:io)',
      'Accept': 'application/json',
    }, Uri.parse(url));

    if (biodataRaw.statusCode == 200) {
      final biodata =
          Client.fromJson(jsonDecode(biodataRaw.body) as Map<String, dynamic>);

      print("--- VOYAGER ID CARD ---\n");
      print("Name: ${biodata.name}");
      print("Email: ${biodata.email}");
      print(
          "Location: ${biodata.address.city}, (Lat: ${biodata.address.geo.lat}, Lng: ${biodata.address.geo.lng})");
    } else {
      print('Status Code: ${biodataRaw.statusCode}');
      print('Response Body: ${biodataRaw.body}');
      throw Exception('nope');
    }
  } catch (e) {
    print('error $e');
  }
}

void main() async {
  getUser();
}

class Client {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  Client(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.address,
      required this.phone,
      required this.website,
      required this.company});

  factory Client.fromJson(Map<String, dynamic> jsonMap) {
    return Client(
        id: jsonMap['id'],
        name: jsonMap['name'],
        username: jsonMap['username'],
        email: jsonMap['email'],
        address: Address.fromJson(jsonMap['address']),
        phone: jsonMap['phone'],
        website: jsonMap['website'],
        company: Company.fromJson(jsonMap['company']));
  }
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  Address(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipcode,
      required this.geo});

  factory Address.fromJson(Map<String, dynamic> jsonMap) {
    return Address(
        street: jsonMap['street'],
        suite: jsonMap['suite'],
        city: jsonMap['city'],
        zipcode: jsonMap['zipcode'],
        geo: Geo.fromJson(jsonMap['geo']));
  }
}

class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({required this.name, required this.catchPhrase, required this.bs});

  factory Company.fromJson(Map<String, dynamic> jsonMap) {
    return Company(
        name: jsonMap['name'],
        catchPhrase: jsonMap['catchPhrase'],
        bs: jsonMap['bs']);
  }
}

class Geo {
  final String lat;
  final String lng;

  Geo({required this.lat, required this.lng});

  factory Geo.fromJson(Map<String, dynamic> jsonMap) {
    return Geo(lat: jsonMap['lat'], lng: jsonMap['lng']);
  }
}
