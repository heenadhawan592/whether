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

  void whether({BuildContext context}) async {
    _netUtil.get(
        "forecast?access_key=a3fd7937c2b651f30024b0cf5a7a3cfe&query=${query.text}",
        headers: {"Content-Type": "application/json"}).then((response) {
      print("whether");
      print(response.request.headers);
      print(response.body);
      print("Body");
      var extracted = json.decode(response.body);

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
                    child: Text(
                      "Tuesday,25 jan 2021",
                      style: TextStyle(color: Colors.black38, fontSize: 14),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Text(
                      "4:00 pm",
                      style: TextStyle(color: Colors.black38, fontSize: 14),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 80,
                ),
                child: Text(
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
              Container(
                color: Colors.black38,
                height: 60,
                width: 80,
                margin: EdgeInsets.only(
                  top: 10,
                ),
                padding: const EdgeInsets.all(15.0),
                // decoration: BoxDecoration(
                //     border: Border.all(color: Colors.blueAccent)
                // ),
                child: Text(
                  "Mist",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "32 degree",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black38,
                  ),
                ),
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
                        child: Text(
                          "89%",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black38,
                          ),
                        ),
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
                        child: Text(
                          "43 degree",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black38,
                          ),
                        ),
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
                        child: Text(
                          "1001mBar",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black38,
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
