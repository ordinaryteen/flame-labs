import 'dart:io';
import 'dart:convert';

void main() async {
  final socket = await SecureSocket.connect('api.open-meteo.com', 443);

  final httpRequest =
      "GET /v1/forecast?latitude=8.1257&longitude=112.5714&current_weather=true HTTP/1.0\r\n"
      "Host: api.open-meteo.com\r\n"
      "Connection: close\r\n\r\n";
  socket.write(httpRequest);

  String fullResponse = "";
  socket.listen((List<int> event) {
    fullResponse += utf8.decode(event);
  }, onDone: () {
    final responseBody = fullResponse.split('\r\n\r\n')[1];
    final jsonData = jsonDecode(responseBody);

    print("\n--- WEATHER DATA ACQUIRED ---");
    print("Temp: ${jsonData['current_weather']['temperature']} °C");
    print("Wind: ${jsonData['current_weather']['windspeed']} km/h");
    print("--------------------------\n");

    socket.destroy();
  }, onError: (error) {
    print("\n[ALERT] Socket Error: $error");
  });
}
