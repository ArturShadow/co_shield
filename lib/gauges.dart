import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'api/arduino.dart';
import 'drawer.dart';
// void main() {
//   return runApp(const GaugeApp());
// }

/// Represents the GaugeApp class
class GaugeApp extends StatelessWidget {
  const GaugeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Radial Gauge Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

/// Represents MyHomePage class
class MyHomePage extends StatefulWidget {
  /// Creates the instance of MyHomePage
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _getGauge({bool isRadialGauge = true}) {
    if (isRadialGauge) {
      return _getRadialGauge();
    } else {
      return _getLinearGauge();
    }
  }

  Widget _getRadialGauge() {
    return FutureBuilder<double>(
      future:
          ArduinoCloud().fetchData(), // Reemplaza con tu función asincrónica
      builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child:
                  CircularProgressIndicator()); // Indicador de carga mientras espera
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          double co = snapshot.data!; // Obtiene el valor del Future
          return SfRadialGauge(
              enableLoadingAnimation: true,
              animationDuration: 3500,
              title: const GaugeTitle(
                  text: 'Niveles de CO',
                  textStyle:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              axes: <RadialAxis>[
                RadialAxis(minimum: 0, maximum: 1500, ranges: <GaugeRange>[
                  GaugeRange(
                      startValue: 0,
                      endValue: 500,
                      color: Colors.green,
                      startWidth: 10,
                      endWidth: 10),
                  GaugeRange(
                      startValue: 500,
                      endValue: 1000,
                      color: Colors.orange,
                      startWidth: 10,
                      endWidth: 10),
                  GaugeRange(
                      startValue: 1000,
                      endValue: 1500,
                      color: Colors.red,
                      startWidth: 10,
                      endWidth: 10)
                ], pointers: <GaugePointer>[
                  NeedlePointer(value: co, enableAnimation: true)
                ], annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                      widget: Text(co.toInt().toString(),
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      angle: 90,
                      positionFactor: 0.5)
                ])
              ]);
        }
      },
    );
  }

  Widget _getLinearGauge() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: SfLinearGauge(
          minimum: 0.0,
          maximum: 100.0,
          orientation: LinearGaugeOrientation.horizontal,
          majorTickStyle: const LinearTickStyle(length: 20),
          axisLabelStyle: const TextStyle(fontSize: 12.0, color: Colors.black),
          axisTrackStyle: const LinearAxisTrackStyle(
              color: Colors.cyan,
              edgeStyle: LinearEdgeStyle.bothFlat,
              thickness: 15.0,
              borderColor: Colors.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: const Menu(), body: _getGauge());
  }
}
