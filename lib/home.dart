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
  void whether({BuildContext context}) async {
    _netUtil.get(
        "forecast?access_key=a3fd7937c2b651f30024b0cf5a7a3cfe&query=${query.text}",
        headers: {"Content-Type": "application/json"}).then((response) {
      print("whether");
      print(response.request.headers);
      print(response.body);
      print("Body");
      var extracted = json.decode(response.body);
print(extracted["location"]["name"]);
cityname=extracted["location"]["name"];
temperature =extracted["current"]["temperature"].toString();
localtime=  extracted["location"]["localtime"].toString();
      pressure=extracted["current"]["pressure"].toString();
      humidity=extracted["current"]["humidity"].toString();
      feelslike=extracted["current"]["feelslike"].toString();
      weather_icons=extracted["current"]["weather_icons"][0];

print(temperature);
print(localtime);
print(pressure);
print(humidity);
print(feelslike);
print(weather_icons);
if(response.statusCode==200){
  setState(() {
    query.text=cityname;

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
      body:SingleChildScrollView(
        child:  Container(
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
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: localtime!=null?Text(
                    localtime,
                      style: TextStyle(color: Colors.black38, fontSize: 14),
                    ):Container()
                  ),
                  // Container(
                  //   margin: EdgeInsets.all(10.0),
                  //   child: Text(
                  //     "4:00 pm",
                  //     style: TextStyle(color: Colors.black38, fontSize: 14),
                  //   ),
                  // ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 80,
                ),
                child: cityname!=null?Text(
                  cityname,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.black38,
                  ),
                ):Text(
                  "Kolkata",
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
             weather_icons!=null?Image.network(
                 weather_icons,
                  height:70,
                  width:70,
                  fit: BoxFit.cover,
                ):Container(),

              Container(
                margin: EdgeInsets.only(top: 10),
                child:temperature!=null? Text(
                  temperature,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black38,
                  ),
                ):Container(),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20, top: 10),
                        // margin: EdgeInsets.only(top: 10,left: 140),
                        child:

                        humidity!=null?Text(
                         humidity,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black38,
                          ),
                        ):Container(child:Text(
                          "89",
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
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20, top: 10),
                        // margin: EdgeInsets.only(top: 10,left: 140),
                        child:feelslike!=null? Text(
                        feelslike,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black38,
                          ),
                        ):Container( child: Text(
                          "43 degree",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black38,
                          ),
                        ),),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
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
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20, top: 10),
                        child: pressure!=null?Text(
                         pressure,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black38,
                          ),
                        ): Container(
                          margin: EdgeInsets.only(left: 20, top: 10),
                          child: Text(
                            "1001mBar",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black38,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 20,
                        ),
                        // margin: EdgeInsets.only(top: 10,left: 140),
                        child: Text(
                          "Pressure",
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
              Container(
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
                        prefixIcon: Icon(Icons.search),
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
      )
    );
  }
}
