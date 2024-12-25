import 'package:flutter/foundation.dart';

class WatherModel {
  final Coord? coord;
  final List<Weather> weather;
  final String base;

}

class Coord {
  final double? lat;
  final double? lon;

  Coord({this.lat, this.lon});

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lat: json['lat'],
        lon: json['lon'],
      );
}

class Weather {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;
  Weather({this.id, this.main, this.description, this.icon});
  factory Weather.fromjson(Map<String, dynamic> json) {
    return Weather(
        id: json['id'],
        main: json['main'],
        description: json['description'],
        icon: json['icon']);
  }
}
class Main {
  final String? temp;
  final String? main;
  final String? feels_like;
  final String? temp_min;
  final String? temp_max;
  final String? pressure;
  final String? humidity;
  final String? sea_level;
  final String? grnd_level;
 

  Main({
    this.temp,
     this.main, 
     this.feels_like,
      this.temp_min,
      this.temp_max,
      this.pressure,
      this.humidity,
      this.sea_level,
      this.grnd_level,
      });
  factory Main.fromjson(Map<String, dynamic> json) {
    return Main(
        temp: json['id'],
        main: json['main'],
        feels_like: json['description'],
        temp_min: json['icon'],
        temp_max: json['temp_max'],
        
        );
       
  }
}
