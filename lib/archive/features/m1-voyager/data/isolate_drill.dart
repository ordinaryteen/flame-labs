import 'dart:convert';
import 'package:dio/dio.dart';

Map<String, dynamic> heavyJsonParsing(String rawStringData) {
  print("[CPU Core 2]: Starting heavy text parsing...");

  for (int i = 0; i < 5000000; i++) {}
  return jsonDecode(rawStringData);
}

void main() async {
  final dio = Dio();
  // We are using dummyjson because jsonplaceholder's firewall (Cloudflare)
  // just decided to block our Dart script! Real world problems!
  final String url = 'https://dummyjson.com/posts';

  print("[CPU Core 1]: Fetching 100 Posts from the network...");
  final response = await dio.get(url);

  final rawStringResponse = jsonEncode(response.data);

  print("\n--- INITIATING HEAVY DECODE ---");

  // TODO 1. The Block (Old Way - Core 1 does everything)

  // TODO 2. The Isolate (New Way - Handing it to Core 2)
  // final parsedData =
  // await Isolate.run(() => heavyJsonParsing(rawStringResponse));

  for (int i = 1; i <= 3; i++) {
    print("[CPU Core 1 - UI Thread]: Drawing Frame $i 🟢");
  }
  print("\n[CPU Core 1]: Final Payload contains 100 posts!");
}
