import 'dart:convert';
import 'package:http/http.dart' as http;

const _kBaseApiUrl = 'https://tutorpoint.in';

Future<dynamic> callApi(Map<String, dynamic> body, String apiUrl) async {
  final String url = '$_kBaseApiUrl/$apiUrl';
  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );

    return json.decode(response.body);
  } catch (e) {
    print('Error of callApi = $e');
    return {'code': -999};
  }
}

Future<dynamic> callGetApi(String apiUrl) async {
  final String url = '$_kBaseApiUrl/$apiUrl';
  try {
    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    return json.decode(response.body);
  } catch (e) {
    print('Error of callApi = $e');
    return {'code': -999};
  }
}
