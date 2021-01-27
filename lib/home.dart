import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whether/constants.dart';
import 'package:whether/networkutil.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home> {
  TextEditingController query = TextEditingController();
  List<Widget> vBrand = [];
  NetworkUtil _netUtil = new NetworkUtil();
  String cityname;
  String localtime;
  String temperature;
  String weather_icons;
  String humidity;
  String feelslike;
  String pressure;
  var isLoading = false;
  void whether({BuildContext context}) async {
    isLoading = true;
    _netUtil.get(
        "forecast?access_key=a3fd7937c2b651f30024b0cf5a7a3cfe&query=${query.text}",
        headers: {"Content-Type": "application/json"}).then((response) {
      print("whether");
      print(response.request.headers);
      print(response.body);
      print("Body");
      var extracted = json.decode(response.body);
      print(extracted["location"]["name"]);
      cityname = extracted["location"]["name"];
      temperature = extracted["current"]["temperature"].toString();
      localtime = extracted["location"]["localtime"].toString();
      pressure = extracted["current"]["pressure"].toString();
      humidity = extracted["current"]["humidity"].toString();
      feelslike = extracted["current"]["feelslike"].toString();
      weather_icons = extracted["current"]["weather_icons"][0];

      print(temperature);
      print(localtime);
      print(pressure);
      print(humidity);
      print(feelslike);
      print(weather_icons);
      if (response.statusCode == 200) {
        setState(() {
          query.text = cityname;
          isLoading = false;
        });
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Whether App",
            style: TextStyle(fontSize: 22, color: Colors.black87),
          ),
          automaticallyImplyLeading: false,
        ),
        body: isLoading
            ? Center(
          child: CircularProgressIndicator(),
        )
            :   Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    // Add one stop for each color
                    // Values should increase from 0.0 to 1.0
                    stops: [
                  0.1,
                  0.5,
                  0.8,
                ],
                    colors: [
                  Colors.red,
                  Colors.yellow,
                  Colors.yellowAccent
                ])),
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10,right: 140,left: 10),
                    child: localtime != null
                              ? Text(
                                  localtime,
                                  style: TextStyle(
                                      color: Colors.black38, fontSize: 16),
                                )
                              : Container(child: Text(
                     "26 jan 2021",
                      style: TextStyle(
                          color: Colors.black38, fontSize: 16),
                    ),)),

                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 100),
                  child: Column(
                    children: [
                      Container(
                        child: cityname != null
                              ? Text(
                                  cityname,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black38,
                                  ),
                                )
                              : Text(
                                  "Delhi",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black38,
                                  ),
                                ),
                      ),

                      Container(
                        margin: EdgeInsets.only(
                          top: 10,
                        ),
                        child: Text(
                          "India",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius:
                        BorderRadius.circular(8.0),
                        child: weather_icons != null
                            ? Image.network(
                                weather_icons,
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                              )
                            : ClipRRect( borderRadius:
                        BorderRadius.circular(8.0),child: Image.network(
                          "https://assets.weatherstack.com/images/wsymbols01_png_64/wsymbol_0004_black_low_cloud.png",
                          height:120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: temperature != null
                            ? Text(
                                temperature+ "\u2103",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30,   fontWeight: FontWeight.w500,
                                  color: Colors.black38,
                                ),
                              )
                            : Container(child: Text( " 20 \u2103" ,textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,   fontWeight: FontWeight.w500,
                            color: Colors.black38,
                          ),),),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          "Haze",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container( alignment: Alignment.center,
                  child: IntrinsicHeight(
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20, top: 10),
                              // margin: EdgeInsets.only(top: 10,left: 140),
                              child: humidity != null
                                  ? Text(
                                humidity+" %",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black38,
                                ),
                              )
                                  : Container(
                                  child: Text(
                                    "89 %",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black38,
                                    ),
                                  )),
                            ),
                            Container(
                              // margin: EdgeInsets.only(top: 10,left: 140),
                              child: Text(
                                "Humidity",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black38,
                                ),
                              ),
                            ),
                          ],
                        ),
                        VerticalDivider(
                          thickness: 2,
                          width: 20,
                          color: Colors.grey,
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20, top: 10),
                              // margin: EdgeInsets.only(top: 10,left: 140),
                              child: feelslike != null
                                  ? Text(
                                feelslike+"  \u2103",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black38,
                                ),
                              )
                                  : Container(
                                  child: Text(
                                    " 20 \u2103",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black38,
                                    ),
                                  )),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                "Feel Like",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black38,
                                ),
                              ),
                            ),
                          ],
                        ),
                        VerticalDivider(
                          thickness: 2,
                          width: 20,
                          color: Colors.grey,
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20, top: 10),
                              // margin: EdgeInsets.only(top: 10,left: 140),
                              child: pressure != null
                                  ? Text(
                                pressure,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black38,
                                ),
                              )
                                  : Container(
                                  child: Text(
                                    "1003mBar",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black38,
                                    ),
                                  )),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                "Feel Like",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black38,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ),
            Container(
             // color: Colors.white,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(30.0),),
                margin: EdgeInsets.all(20.0),
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                    controller: query,
                    onSubmitted: (value) {

                      whether(context: context);
                    },
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        suffixIcon: Icon(Icons.search),
                        hintText: "Enter city name ",
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 32.0),
                            borderRadius: BorderRadius.circular(25.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 32.0),
                            borderRadius: BorderRadius.circular(25.0)))),
              ),


              ],
            ),
          ),
        );
  }
}
