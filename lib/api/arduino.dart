import 'package:co_shield_2_0/constans/api_constants.dart';
import 'package:co_shield_2_0/api/token.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class ArduinoCloud {
  Future<double> fetchData() async {
    var url = Constants().coURL;
    var token = await FetchToken().fetchAccessToken();
    final response = await http.get(url,
        headers: {
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      var lastValue = json.decode(response.body)['last_value'];
      return lastValue;
    } else {
      throw Exception('Failed to load data');
    }
  }
}