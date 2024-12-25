import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/Model/Weather_model.dart';

class DataApi {
  static const String apiKey = '207bbc8082f2998b155a7476c76ca1e8';

  static Future<WeatherData?> fetchData(String city) async {
    String link =
        'https://api.openweathermap.org/data/2.5/weather?q=${Uri.encodeComponent(city)}&appid=$apiKey';

    try {
      final url = Uri.parse(link);
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return WeatherData.fromJson(jsonData);
      } else {
        print('Error: ${response.statusCode}');
        print('Message: ${response.body}');
        return null;
      }
    } catch (e) {
      print('An error occurred: $e');
      return null;
    }
  }
}

