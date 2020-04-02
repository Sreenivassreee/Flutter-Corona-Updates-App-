import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'India.dart';
import 'Phone.dart';

class HomePage extends StatefulWidget {
  // final String title;
  HomePage({
    Key key,
  }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = "https://api.rootnet.in/covid19-in/stats/latest";

  final String worldUrl="https://api.rootnet.in/covid19-in/contacts";
  var data,wData;
  var isLoading = true;
  var isLoading2 = true;

  var date;

  @override
  void initState() {
    getjsondata();
    worldData();
    super.initState();
  }

  Future<String> getjsondata() async {
    var response = await http.get(
      Uri.encodeFull(url),
    );
    print(response.body);
    setState(() {
      var convertDatatoJson = json.decode(response.body);
      data = convertDatatoJson;
      isLoading = false;

      
      date = data["lastRefreshed"];
    });
  }
Future<String> worldData() async {
    var response2 = await http.get(
      Uri.encodeFull(worldUrl),
    );
    print(response2.body);
    setState(() {
      var convertDatatoJson = json.decode(response2.body);
      wData = convertDatatoJson;
      isLoading2 = false;

     
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("COVID 19"),
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
        ),
        body: isLoading == true && isLoading2==true
            ? Center(child: 
          
          Stack(
            
           
            children: <Widget>[
             Container(
              //  decoration: new BoxDecoration(color: Colors.black),
              color: Colors.black,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Image.asset("assets/steve.png",
                    fit: BoxFit.fill,),
                  ),
                  Text("Developed by Sreenivas k",style: TextStyle(fontSize: 20.0))
                ],
              ),
            ),

            ],
            
             
          )
            
            )
            : Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 10.0),
                        Text(
                          "Official Data from",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text("Ministry of Health and Welfare",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 22.0),
                      child: Text(
                        "Last Update : $date ",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(17.0),
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text("India",
                                    style: TextStyle(
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.bold
                                    )),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 1, 20, 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Total",
                                            style: TextStyle(
                                              fontSize: 15.0,
                                            )),
                                        SizedBox(height: 17.0),
                                        Text(
                                            (data['data']["summary"]['total'])
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.bold
                                            )),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Indians",
                                            style: TextStyle(
                                              fontSize: 15.0,
                                            )),
                                        SizedBox(height: 17.0),
                                        Text(
                                            (data['data']["summary"]
                                                    ['confirmedCasesIndian'])
                                                .toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25.0,
                                            )),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Foreign",
                                            style: TextStyle(
                                              fontSize: 17.0,
                                            )),
                                        SizedBox(height: 10.0),
                                        Text(
                                            (data['data']["summary"]
                                                    ['confirmedCasesForeign'])
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.bold

                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Cured",
                                            style: TextStyle(
                                              fontSize: 15.0,
                                            )),
                                        SizedBox(height: 17.0),
                                        Text(
                                            (data['data']["summary"]
                                                    ['discharged'])
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 25.0,
                                              fontWeight: FontWeight.bold,

                                                color: Colors.green)),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Deaths",
                                            style: TextStyle(
                                              fontSize: 17.0,
                                            )),
                                        SizedBox(height: 17.0),
                                        Text(
                                            (data['data']["summary"]['deaths'])
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 25.0,
                                              fontWeight: FontWeight.bold,

                                                color: Colors.red)),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Unidentified",
                                            style: TextStyle(
                                              fontSize: 15.0,
                                            )),
                                        SizedBox(height: 17.0),
                                        Text(
                                            (data['data']["summary"][
                                                    'confirmedButLocationUnidentified'])
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 25.0,
                                              fontWeight: FontWeight.bold,
                                              
                                                color: Colors.red)),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: SizedBox(
                          height: 50.0,
                          width: 330.0,
                          child: MaterialButton(
                              elevation: 10.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: Colors.white)),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => India(data: data)),
                                );
                              },
                              child: Text(
                                "India Updates",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ))),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: SizedBox(
                          height: 50.0,
                          width: 330.0,
                          child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: Colors.white)),
                              onPressed: (){ Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Phone(wData: wData)),
                                );},
                              child: Text(
                                "Contact Numbers",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ))),
                    ),
              
                  ],
                ),
            ));
  }
}
