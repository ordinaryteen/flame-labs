import 'dart:convert';
import 'package:http/http.dart' as http;

final latitude = "35.68";
final longitude = "139.69";

final url =
    "https://api.open-meteo.com/v1/forecast?latitude=${latitude}&longitude=${longitude}&current_weather=true";
void main() async {
  final Uri weatherUrl = Uri.parse(url);
  final http.Response response = await http.get(weatherUrl);

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonData = jsonDecode(response.body);

    print("\n--- WEATHER DATA ACQUIRED (PRODUCTION) ---");
    print("Temp: ${jsonData['current_weather']['temperature']} °C");
    print("Wind: ${jsonData['current_weather']['windspeed']} km/h");
    print("------------------------------------------\n");
  } else {
    print("Server rejected us! Status Code: ${response.statusCode}");
  }
}
