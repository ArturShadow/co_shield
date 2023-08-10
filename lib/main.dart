import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> fetchData() async {
    var token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJodHRwczovL2FwaTIuYXJkdWluby5jYy9pb3QiLCJhenAiOiJsNzdESHYxOHZvR2JWV05GYmJYcTlnY0tVVVpNdVNGNCIsImV4cCI6MTY5MTYzMjgxNiwiZ3R5IjoiY2xpZW50LWNyZWRlbnRpYWxzIiwiaHR0cDovL2FyZHVpbm8uY2MvY2xpZW50X2lkIjoiQWlyZHVpbm8iLCJodHRwOi8vYXJkdWluby5jYy9pZCI6ImZjMzhlMmFlLTJhNjktNDMzYi1iOTA2LTk4ZjYyZTFhNmI3YiIsImh0dHA6Ly9hcmR1aW5vLmNjL3JhdGVsaW1pdCI6MTAsImh0dHA6Ly9hcmR1aW5vLmNjL3VzZXJuYW1lIjoiZW5pYm94IiwiaWF0IjoxNjkxNjMyNTE2LCJzdWIiOiJsNzdESHYxOHZvR2JWV05GYmJYcTlnY0tVVVpNdVNGNEBjbGllbnRzIn0._SxRzm9crUm0qSbvf221Lx0nW2pKaBHlA8c800IJRhs";
    //const clientId = 'l77DHv18voGbVWNFbbXq9gcKUUZMuSF4';
    //const clientSecret = 'ggpfD2zfUrJ6UmHqeheN09orTqyzO5hI6wnPfzL1sFr51LUSEZtIy2LcDH9x8mj5';
    final response = await http.get(
        Uri.parse(
            'https://api2.arduino.cc/iot/v2/things/f8c6a63b-a11d-4939-9b23-673c08ebcb54/properties/08987657-b51a-4a3a-b7d1-d5022f9b3d86'),
        headers: {
          'Authorization': 'Bearer $token',
          // 'Access-Control-Allow-Origin': '*',
          // 'audience': 'https://api2.arduino.cc/iot',
          // 'client_id': clientId,
          // 'client_secret': clientSecret
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
        body: FutureBuilder<bool>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.toString());
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
