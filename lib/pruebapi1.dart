import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchDataFromArduinoCloud() async {
  // final String apiUrl =
  //     'https://api2.arduino.cc/iot/v1/7b628bc9-3dab-4e42-87f3-be57ed0aef64';
  // final String authToken =
  //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJodHRwczovL2FwaTIuYXJkdWluby5jYy9pb3QiLCJhenAiOiJsNzdESHYxOHZvR2JWV05GYmJYcTlnY0tVVVpNdVNGNCIsImV4cCI6MTY5MTQ1OTMwMiwiZ3R5IjoiY2xpZW50LWNyZWRlbnRpYWxzIiwiaHR0cDovL2FyZHVpbm8uY2MvY2xpZW50X2lkIjoiQWlyZHVpbm8iLCJodHRwOi8vYXJkdWluby5jYy9pZCI6ImZjMzhlMmFlLTJhNjktNDMzYi1iOTA2LTk4ZjYyZTFhNmI3YiIsImh0dHA6Ly9hcmR1aW5vLmNjL3JhdGVsaW1pdCI6MTAsImh0dHA6Ly9hcmR1aW5vLmNjL3VzZXJuYW1lIjoiZW5pYm94IiwiaWF0IjoxNjkxNDU5MDAyLCJzdWIiOiJsNzdESHYxOHZvR2JWV05GYmJYcTlnY0tVVVpNdVNGNEBjbGllbnRzIn0._O9Yqm-wUl4kF26jnM2JHZwNwTVPcwRYvCt0FKm6ICc'; // Reemplaza esto con tu token de autenticación

  final String apiUrl = 'http://192.168.0.10:8000/';

  try {
    final response = await http.get(Uri.parse(apiUrl)
        // headers: {
        //   'Authorization': 'Bearer $authToken',
        // },
        );

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      // Aquí puedes trabajar con los datos obtenidos
      print(decodedData);
    } else {
      print('Error en la solicitud: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
