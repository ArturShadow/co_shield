// Importamos la biblioteca Dio, que es una solución poderosa para realizar solicitudes HTTP en Dart.
import 'package:dio/dio.dart';

/// La clase `FetchToken` se encarga de comunicarse con la API de Arduino
/// para obtener un token de acceso.
class FetchToken {
  /// `fetchAccessToken` es un método asíncrono que intenta obtener un token de acceso
  /// haciendo una solicitud POST a la API de Arduino.
  ///
  /// Retorna un `String` con el token de acceso si la solicitud es exitosa.
  ///
  /// Lanza una excepción si no se puede obtener el token.
  Future<String> fetchAccessToken() async {
    // Creamos una instancia de Dio para realizar la solicitud.
    final dio = Dio();

    // Variable para almacenar el token de acceso.
    var accessToken = '';

    // Realizamos una solicitud POST a la URL especificada para obtener el token.
    // Los datos necesarios para la autenticación, como el client_id y client_secret, se envían en el cuerpo de la solicitud.
    final response = await dio.post(
      'https://api2.arduino.cc/iot/v1/clients/token',
      options: Options(headers: {'Content-Type': 'application/json'}),
      data: {
        'grant_type': 'client_credentials',
        'client_id': 'l77DHv18voGbVWNFbbXq9gcKUUZMuSF4',
        'client_secret':
            'ggpfD2zfUrJ6UmHqeheN09orTqyzO5hI6wnPfzL1sFr51LUSEZtIy2LcDH9x8mj5',
        'audience': 'https://api2.arduino.cc/iot'
      },
    );

    // Si la respuesta es exitosa (código 200), extraemos el token del cuerpo de la respuesta y lo retornamos.
    if (response.statusCode == 200) {
      final data = response.data;
      accessToken = data['access_token'];
      return accessToken;
    } else {
      // Si la respuesta no es exitosa, lanzamos una excepción.
      throw Exception('Failed to fetch access token');
    }
  }
}
