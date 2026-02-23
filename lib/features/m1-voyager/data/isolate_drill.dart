import 'dart:isolate';
import 'dart:convert';
import 'dart:async';
import 'package:dio/dio.dart';

Map<String, dynamic> heavyJsonParsing(String rawStringData) {
  print("[Heavy worker]: Starting heavy text parsing...");
  // Mathematically spinning the CPU wheels to simulate freezing!
  for (int i = 0; i < 900000000; i++) {}
  return jsonDecode(rawStringData);
}

void main() async {
  final dio = Dio();
  final String url = 'https://dummyjson.com/posts';

  print("[CPU Core 1]: Fetching 100 Posts from the network...");
  final response = await dio.get(url);
  final rawStringResponse = jsonEncode(response.data);

  print("\n--- INITIATING HEAVY DECODE ---");
  print(
      "(We are injecting a 1-second timeout before starting so the UI can draw...)");

  await Future.delayed(Duration(seconds: 1));

  final stopwatch = Stopwatch()..start();

  // We set up a recurring timer. This simulates the Flutter Engine trying to draw
  // a frame on the screen every 100 milliseconds.
  final uiTimer = Timer.periodic(Duration(milliseconds: 100), (timer) {
    print("[CPU Core 1 - UI Thread]: Drawing Frame ${timer.tick} 🟢");
  });

  // =========================================================
  // TODO 1. The Block (Old Way - Core 1 does everything)
  // Uncomment the line below, and comment TODO 2.
  // final parsedData = heavyJsonParsing(rawStringResponse);
  // =========================================================

  // =========================================================
  // TODO 2. The Isolate (New Way - Handing it to Core 2)
  // Uncomment the line below, and comment TODO 1.
  final parsedData =
      await Isolate.run(() => heavyJsonParsing(rawStringResponse));
  // =========================================================

  stopwatch.stop();
  uiTimer.cancel(); // Stop drawing frames when parsing is done.

  print("\n[CPU Core 1]: Final Payload contains 100 posts!");
  print("[⏱️ TIMER]: Finished in ${stopwatch.elapsedMilliseconds} ms");
}
