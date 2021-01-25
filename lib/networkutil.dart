import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

import 'constants.dart';

class NetworkUtil {

  static NetworkUtil _instance = new NetworkUtil.internal();
  NetworkUtil.internal();
  factory NetworkUtil() => _instance;

  Future<http.Response> get(String url,
      {Map<String, String> headers, body, encoding}) {
    try {
      final ioc = new HttpClient();
      ioc.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);
      return http
          .get(
        Constants.baseUrl + url,
        headers: headers,
      )
          .then((response) {
        final int statusCode = response.statusCode;

        if (statusCode < 200 || statusCode > 400 || json == null) {
          throw new Exception("Error while fetching data");
        }

        return response;
      });
    } catch (e) {}
  }

  Future<http.Response> post(String url,
      {Map<String, String> headers, body, encoding}) {
    try {
      final ioc = new HttpClient();
      ioc.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);
      print(Constants.baseUrl + url);
      print(body);

      return http
          .post(Constants.baseUrl + url,
              body: utf8.encode(json.encode(body)),
              headers: headers,
              // headers: {"Content-Type": "application/json"},
              encoding: encoding)
          .then((response) {
        if (response == null) {
          throw new Exception("Error while fetching data");
        }
        print(response.statusCode);
        if (response.statusCode < 200 || response.statusCode > 400) {
          throw new Exception("Error while fetching data1");
        }

        return response;
      }).catchError((error) {
        throw new Exception("Error " + error.toString());
      });
    } catch (e) {}
  }
}
