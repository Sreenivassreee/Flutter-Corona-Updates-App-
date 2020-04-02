import 'package:flutter/material.dart';


class India extends StatefulWidget {
  var data;
  India({
    Key key,this.data
  }) : super(key: key);
  @override
  _IndiaState createState() => _IndiaState(data:data);
}

class _IndiaState extends State<India> {
  var data;
  _IndiaState({this.data});
  
  var isLoading = true;

 
  @override
  Widget build(BuildContext context) {

     if(data!=null){
  isLoading = false;
    
  }
  
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Text("India Updates"),
        centerTitle: true,
        
        
        
      ),
      body: 
      
      isLoading == true?
      Center(child: CircularProgressIndicator()):
      


      
      ListView.builder(
        itemCount:data['data']["regional"].length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Center(
                              child: Text(data['data']["regional"][index]['loc'],
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold
                                  )),
                            ),
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(1, 1, 1, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("Confirmed",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600
                                      
                                    )),
                                SizedBox(height:10.0),
                                Text((data['data']["regional"][index]['confirmedCasesIndian']).toString(),
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    )),
                              ],
                            ),
                             Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("Active",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600
                                    )),
                                SizedBox(height:10.0),
                                Text((data['data']["regional"][index]['confirmedCasesIndian']-data['data']["regional"][index]['discharged']-data['data']["regional"][index]['deaths']).toString(),
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    )),
                              ],
                            ),
                            Column(
                              
                              children: <Widget>[
                                Text("Cured",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600
                                    )),
                                SizedBox(height:10.0),
                                    
                                Text((data['data']["regional"][index]['discharged']).toString(),
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.green

                                    )),
                              ],
                            ),
                            Column(
                              
                              children: <Widget>[
                                Text("Deaths",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600

                                    )),
                                SizedBox(height:0.0),

                                Text((data['data']["regional"][index]['deaths']).toString(),
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.red
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                );
        },
      ),
    );
  }
}
