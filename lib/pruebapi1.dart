import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<String> fetchData() async {
    var token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJodHRwczovL2FwaTIuYXJkdWluby5jYy9pb3QiLCJhenAiOiJsNzdESHYxOHZvR2JWV05GYmJYcTlnY0tVVVpNdVNGNCIsImV4cCI6MTY5MTYyNzMxNiwiZ3R5IjoiY2xpZW50LWNyZWRlbnRpYWxzIiwiaHR0cDovL2FyZHVpbm8uY2MvY2xpZW50X2lkIjoiQWlyZHVpbm8iLCJodHRwOi8vYXJkdWluby5jYy9pZCI6ImZjMzhlMmFlLTJhNjktNDMzYi1iOTA2LTk4ZjYyZTFhNmI3YiIsImh0dHA6Ly9hcmR1aW5vLmNjL3JhdGVsaW1pdCI6MTAsImh0dHA6Ly9hcmR1aW5vLmNjL3VzZXJuYW1lIjoiZW5pYm94IiwiaWF0IjoxNjkxNjI3MDE2LCJzdWIiOiJsNzdESHYxOHZvR2JWV05GYmJYcTlnY0tVVVpNdVNGNEBjbGllbnRzIn0.FFcQWM_OSsS0O5T9npYin7MLuKZhTHG51PHzrEI_rWQ";
    final response = await http
        .get(Uri.parse('https://api2.arduino.cc/iot/v2/things'), headers: {
      'Autorization': 'Bearer: $token',
      'Access-Control-Allow-Origin': '*',
      'audience': 'https://api2.arduino.cc/iot'
    });
    if (response.statusCode == 200) {
      var lastValue = json.decode(response.body)['last_value'];
      return lastValue;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arduino API Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Arduino API Demo'),
        ),
        body: FutureBuilder<String>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
