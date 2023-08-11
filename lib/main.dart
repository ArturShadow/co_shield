import 'package:flutter/material.dart';
import 'api/arduino.dart';
import 'gauges.dart';

void main() => runApp(const GaugeApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arduino API Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Arduino API Demo'),
        ),
        body: FutureBuilder<dynamic>(
          future: ArduinoCloud().fetchData(),
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
