import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:co_shield_2_0/token.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<dynamic> fetchData() async {
    var token = await FetchToken().fetchAccessToken();
    final response = await http.get(
        Uri.parse(
            'https://api2.arduino.cc/iot/v2/things/7b628bc9-3dab-4e42-87f3-be57ed0aef64/properties/2347eeb2-054f-4179-8490-aad3d5cb6e63'),
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
        body: FutureBuilder<dynamic>(
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
