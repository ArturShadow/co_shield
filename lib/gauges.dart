import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:co_shield_2_0/drawer.dart';
import 'api/arduino.dart';

/// Represents the GaugeApp class
class GaugeApp extends StatelessWidget {
  const GaugeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CO Shield',
      theme: ThemeData(primarySwatch: Colors.indigo),
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
    var co = ArduinoCloud().fetchData();
  Widget _getGauge({bool isRadialGauge = true}) {
    if (isRadialGauge) {
      return _getRadialGauge();
    } else {
      return _getLinearGauge();
    }
  }

  Widget _getRadialGaug {
    //print(valorSensorCO);
    return SfRadialGauge(
        enableLoadingAnimation: true,
        animationDuration: 3500,
        title: const GaugeTitle(
            text: 'Niveles de CO',
            textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
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
            NeedlePointer(value:co, enableAnimation: true)
          ], annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Text(co.toString(),
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold)),
                angle: 90,
                positionFactor: 0.5)
          ])
        ]);
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
              color: Colors.amber,
              edgeStyle: LinearEdgeStyle.bothFlat,
              thickness: 15.0,
              borderColor: Colors.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        drawer: Menu(),
        //appBar: AppBar(title: const Text('CO SHIELD'), centerTitle: true),
        body: GaugeApp());
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arduino Cloud API'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ();
          },
          child: const Text('Obtener datos desde Arduino Cloud'),
        ),
      ),
    );
  }
}
