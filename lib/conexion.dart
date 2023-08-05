import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

Future<double> obtenerDatosSensorCO() async {
  // URL de la API de Arduino Cloud
  String url =
      'https://api2.arduino.cc/iot/v2/things/f8c6a63b-a11d-4939-9b23-673c08ebcb54';

  // Parámetros de autenticación (obtenidos de Arduino Cloud)
  String clientId = 'l77DHv18voGbVWNFbbXq9gcKUUZMuSF4';
  String clientSecret =
      'ggpfD2zfUrJ6UmHqeheN09orTqyzO5hI6wnPfzL1sFr51LUSEZtIy2LcDH9x8mj5';

  // Realiza la solicitud HTTP
  final response = await http.get(
    Uri.parse(url),
    headers: {
      'Authorization': 'Bearer $clientId:$clientSecret',
    },
  );

  print(response.statusCode);

  // Verifica si la solicitud fue exitosa
  if (response.statusCode == 200) {
    // Parsea la respuesta JSON
    var data = jsonDecode(response.body);
    print('Hola');
    print(data);

    // Extrae el valor del sensor de CO
    double valorCO = data['mQ2'];
    return valorCO;
  } else {
    throw Exception('Error al obtener los datos del sensor de CO');
  }
}
