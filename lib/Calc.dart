import 'package:flutter/material.dart';

class Calc extends StatefulWidget {
  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  var isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      top: isEnabled ? 250 : 0,
      bottom: isEnabled ? 20 : 0,
      left: isEnabled ? 20 : 0,
      right: isEnabled ? 20 : 0,
      duration: Duration(milliseconds: 300),
      child:
          /*Scaffold(
            appBar: AppBar(
              leading: FlatButton(child: Icon(Icons.menu, color: Colors.white,), onPressed: (){
                setState(() {
                  isEnabled = !isEnabled;
                });
                print(isEnabled);
              },),
              title: Text("Next Gen Calc", style: TextStyle(color: Colors.white),),
              centerTitle: true,
              backgroundColor: Color(0xffFF5545),
              elevation: 0,
              bottomOpacity: 0.0,
            ),
            body: Container(
              color: Color(0xffFF5545),
            ),
          )*/
          Material(
        animationDuration: Duration(milliseconds: 300),
        color: Color(0xffFF5545),
        borderRadius: isEnabled? BorderRadius.circular(30) : BorderRadius.circular(0) ,
        child: SafeArea(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              color: Color(0xffFF5545),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      FlatButton(
                        child: isEnabled? Icon(
                          Icons.close,
                          color: Colors.white,
                        ) : Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            isEnabled = !isEnabled;
                          });
                          print(isEnabled);
                        },
                      ),
                      Text(
                        "Next Gen Calc",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
