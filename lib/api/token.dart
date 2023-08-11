import 'package:dio/dio.dart';

class FetchToken {
  Future<String> fetchAccessToken() async {
    final dio = Dio();
    var accessToken = '';
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

    if (response.statusCode == 200) {
      final data = response.data;
      accessToken = data['access_token'];
      // print(accessToken);
      return accessToken;
    } else {
      throw Exception('Failed to fetch access token');
    }
  }
}
