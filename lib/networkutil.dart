import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:whether/Temprature.dart';

import 'constants.dart';

class NetworkUtil {
String query;
  static NetworkUtil _instance = new NetworkUtil.internal();
  NetworkUtil.internal();
  factory NetworkUtil() => _instance;
  Future<Temprature> fetchWhether() async {
    final response =
    await http.get('http://api.weatherstack.com/forecast?access_key=a3fd7937c2b651f30024b0cf5a7a3cfe&query=Delhi');

    if (response.statusCode == 200) {

      return Temprature.fromMap(jsonDecode(response.body));
    } else {

      throw Exception('Failed to load album');
    }
  }
}
