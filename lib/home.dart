import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whether/Temprature.dart';
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
  Future<Temprature> futureTemprature;



  void whether({BuildContext context}) async {

    _netUtil.fetchWhether();

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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: FutureBuilder<Temprature>(
            future: futureTemprature,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return  Container(
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
                          margin: EdgeInsets.only(top: 10,right: 170,left: 10),
                          child:  Text(
                            "Tuesday, 26 July 2021",
                            style: TextStyle(
                              color: Colors.black38, fontSize: 16, fontWeight: FontWeight.w500,),
                          )
                             ),
                      Container(
                          margin: EdgeInsets.only(top: 10,right: 170,left: 10),
                          child:Text(
                            snapshot.data.localtime.toString(),
                            style: TextStyle(
                                color: Colors.black38, fontSize: 16, fontWeight: FontWeight.w500),
                          )
                            ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 100),
                        child: Column(
                          children: [
                            Container(
                              child:Text(
                                snapshot.data.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.black38,
                                ),
                              )

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
                              child:Image.network(
                                snapshot.data.image,
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                              )

                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child:  Text(
                                snapshot.data.temperature.toString()+ "\u2103",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30,   fontWeight: FontWeight.w500,
                                  color: Colors.black38,
                                ),
                              )

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
                                      child:Text(
                                        snapshot.data.humidity.toString() ,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black38,
                                        ),
                                      )

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
                                      child:  Text(
                                        snapshot.data.feelslike.toString()+"  \u2103",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black38,
                                        ),
                                      )

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
                                      child: Text(
                                        snapshot.data.feelslike.toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black38,
                                        ),
                                      )

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
                             // futureTemprature = fetchWhether();
                               whether(context: context);
                            },
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xfff6f6f6),
                                contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                suffixIcon: Icon(Icons.search,color:Colors.yellow,size: 30 ,),
                                hintText: "Enter city Name ",hintStyle: TextStyle(color: Colors.yellow),
                                border: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.yellow, width: 32.0),
                                    borderRadius: BorderRadius.circular(10.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.white, width: 32.0),
                                    borderRadius: BorderRadius.circular(14.0)))),
                      ),


                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),



        );
  }
}
