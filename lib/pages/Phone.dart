import 'package:flutter/material.dart';


class Phone extends StatefulWidget {
  var wData;
  Phone({
    Key key,this.wData
  }) : super(key: key);
  @override
  _PhoneState createState() => _PhoneState(wData);
}

class _PhoneState extends State<Phone> {
 var wData;
 _PhoneState(this.wData);

 
  var isLoading = true;

  @override
  void initState() {
  see();
    super.initState();
  }

 void see(){

      print(wData);
      print(wData['data']['contacts']["regional"][0]['loc']);
      
 }


  

  @override

  
  Widget build(BuildContext context) {

     if(wData!=null){
  isLoading = false;
    
  }
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Text("COVID 19 Updates"),
        centerTitle: true,
        
        
        
      ),
      body: 
     
    
      isLoading == true?
      Center(child: CircularProgressIndicator()):
      


      
      ListView.builder(
        itemCount:wData['data']['contacts']["regional"].length,
        

  
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(4, 1, 4, 1),
            child: Card(
              
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
              
                              Center(
                                child: Text(wData['data']['contacts']["regional"][index]['loc'],
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Center(
                            child: Text(wData['data']['contacts']["regional"][index]['number'],
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold
                                  ,color: Colors.orange
                                )),
                          ),
                        ),

                       
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
