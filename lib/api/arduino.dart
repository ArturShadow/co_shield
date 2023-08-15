// Importamos las constantes de la API.
import 'package:co_shield_2_0/constans/api_constants.dart';

// Importamos el token necesario para las solicitudes a la API.
import 'package:co_shield_2_0/api/token.dart';

// Importamos librerías necesarias para manejo de datos y solicitudes HTTP.
import 'dart:convert';
import 'package:http/http.dart' as http;

/// La clase `ArduinoCloud` se encarga de comunicarse con una API
/// para obtener datos, probablemente relacionados con Arduino o algún sensor.
class ArduinoCloud {
  /// `fetchData` es un método que obtiene y retorna un valor numérico (double)
  /// desde la API especificada en las constantes.
  ///
  /// Lanza una excepción si hay problemas al cargar los datos.
  Future<double> fetchData() async {
    // Definimos la URL de la API desde donde vamos a obtener los datos.
    var url = Constants().coURL;

    // Obtenemos el token necesario para autenticar la solicitud.
    var token = await FetchToken().fetchAccessToken();

    // Realizamos una solicitud GET a la API con el token de autorización.
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
    });

    // Si la respuesta es exitosa (código 200),
    // decodificamos el JSON y retornamos el valor solicitado.
    if (response.statusCode == 200) {
      double lastValue = json.decode(response.body)['last_value'];
      return lastValue;
    } else {
      // Si la respuesta no es exitosa, lanzamos una excepción.
      throw Exception('Failed to load data');
    }
  }
}
