import 'package:flutter/cupertino.dart';
class Temprature {
  final String name;
  final String localtime;
  final int temperature,pressure,humidity,feelslike;
  final String image;

  Temprature(this.name, this.localtime,this.humidity,this.feelslike ,this.pressure,this.temperature, this.image);
  factory Temprature.fromMap(Map<String, dynamic> json) {
    return Temprature(
      json ["location"]['name'],
      json ["location"]['description'],
      json["current"]['temperature'],
      json["current"]['weather_icons'],
     json["current"]["pressure"],
      json ["current"]["humidity"],
      json["current"]["feelslike"]

    );
  }
}