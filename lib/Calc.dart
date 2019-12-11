import 'package:flutter/material.dart';

class Calc extends StatefulWidget {
  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  List<bool> isSelected = List.generate(4, (_) => false);
  var _ra;
  var isEnabled = false;
  double op;
  TextEditingController first = new TextEditingController();
  TextEditingController second = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      top: isEnabled ? 250 : 0,
      bottom: isEnabled ? 20 : 0,
      left: isEnabled ? 20 : 0,
      right: isEnabled ? 20 : 0,
      duration: Duration(milliseconds: 300),
      child: Material(
        animationDuration: Duration(milliseconds: 300),
        color: Color(0xffFF5545),
        borderRadius:
            isEnabled ? BorderRadius.circular(30) : BorderRadius.circular(0),
        child: SafeArea(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              color: Color(0xffFF5545),
              child: Column(
                children: <Widget>[
                  top(),
                  SizedBox(height: 30),
                  disp(),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),

                  nums(),
                  SizedBox(
                    height: 25.0,
                  ),

                  actions(),

                  SizedBox(
                    height: 25.0,
                  ),
                  FlatButton(
                    onPressed: () {
                      calc();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    padding: EdgeInsets.all(9),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Calculate",
                        style: TextStyle(fontSize: 50.0),
                      ),
                    ),
                    color: Colors.white,
                  )
                  //numbers(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget top() {
    return Row(
      children: <Widget>[
        FlatButton(
          child: isEnabled
              ? Icon(
                  Icons.close,
                  color: Colors.white,
                )
              : Icon(
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
    );
  }

  Widget disp() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.05,
      height: MediaQuery.of(context).size.height / 4.5,
      child: Card(
        elevation: 0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Center(
          child: (op == null)
              ? Text(
                  "NEXT GEN CALC",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff0DFF46),
                      fontSize: 50.0),
                )
              : Text(
                  op.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff0DFF46),
                      fontSize: 70.0),
                ),
        ),
      ),
    );
  }

  Widget nums() {
    return Form(
      key: _formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 2.3,
            child: Card(
              color: Color(0xffFF386F),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a Value';
                  }
                  return null;
                },
                  controller: first,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.add),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    labelText: 'First Number',
                  )),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2.3,
            child: Card(
              color: Color(0xffFF386F),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter A Value';
                  }
                  return null;
                },
                  keyboardType: TextInputType.number,
                  controller: second,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.add),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    labelText: 'Second Number',
                  )),
            ),
          ),
        ],
      ),
    );
  }

  calc() {
    double _first;
    double _second;
    setState(() {
      try{
        _first = double.parse(first.value.text.toString());
        _second = double.parse(second.value.text.toString());
      }
      catch(e){
        /*showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              // Retrieve the text the that user has entered by using the
              // TextEditingController.
              content: Text(e.toString()),
            );
          },
        );*/
      }
    });
    switch (_ra) {
      case "+":
        op = _first + _second;
        break;
      case "-":
        op = _first - _second;
        break;
      case "*":
        op = _first * _second;
        break;
      case "/":
        op = _first / _second;
        break;
      default:
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              // Retrieve the text the that user has entered by using the
              // TextEditingController.
              content: Text("Some Field Is Empty"),
            );
          },
        );
    }
  }

  Widget actions() {
    return ToggleButtons(
      isSelected: isSelected,
      selectedBorderColor: Colors.black,
      selectedColor: Colors.white,
      borderColor: Colors.black,
      fillColor: Color(0xff10B324),
      borderWidth: 0,
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < isSelected.length; i++) {
            if (i == index) {
              isSelected[i] = true;
            } else {
              isSelected[i] = false;
            }
          }
          //isSelected[index] = !isSelected[index];
        });
        print(index);
        switch (index) {
          case 0:
            _ra = "+";
            break;
          case 1:
            _ra = "-";
            break;
          case 2:
            _ra = "*";
            break;
          case 3:
            _ra = "/";
            break;
        }
        print(_ra);
      },
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Icon(
            Icons.add_circle_outline,
            color: Color(0xff0DFF46),
            size: 80.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Icon(
            Icons.remove_circle_outline,
            color: Color(0xff0DFF46),
            size: 80.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Icon(
            Icons.highlight_off,
            color: Color(0xff0DFF46),
            size: 80.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Icon(
            Icons.do_not_disturb_alt,
            color: Color(0xff0DFF46),
            size: 80.0,
          ),
        ),
      ],
    );
  }

  Widget bakactions() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: FlatButton(
              onPressed: () {},
              child: Icon(
                Icons.add_circle_outline,
                color: Color(0xff0DFF46),
                size: 80.0,
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: FlatButton(
              onPressed: () {},
              child: Icon(
                Icons.remove_circle_outline,
                color: Color(0xff0DFF46),
                size: 80.0,
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: FlatButton(
              onPressed: () {},
              child: Icon(
                Icons.highlight_off,
                color: Color(0xff0DFF46),
                size: 80.0,
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: FlatButton(
              onPressed: () {},
              child: Icon(
                Icons.do_not_disturb_alt,
                color: Color(0xff0DFF46),
                size: 80.0,
              )),
        ),
      ],
    );
  }

  numbers() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                onPressed: () {},
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "1",
                    style: TextStyle(fontSize: 80.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                onPressed: () {},
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "2",
                    style: TextStyle(fontSize: 80.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                onPressed: () {},
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "3",
                    style: TextStyle(fontSize: 80.0),
                  ),
                ),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                onPressed: () {},
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "4",
                    style: TextStyle(fontSize: 80.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                onPressed: () {},
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "5",
                    style: TextStyle(fontSize: 80.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                onPressed: () {},
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "6",
                    style: TextStyle(fontSize: 80.0),
                  ),
                ),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                onPressed: () {},
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "7",
                    style: TextStyle(fontSize: 80.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                onPressed: () {},
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "8",
                    style: TextStyle(fontSize: 80.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                onPressed: () {},
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "9",
                    style: TextStyle(fontSize: 80.0),
                  ),
                ),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                onPressed: () {},
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "AC",
                    style: TextStyle(fontSize: 60.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                onPressed: () {},
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "0",
                    style: TextStyle(fontSize: 80.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                onPressed: () {},
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.backspace,
                    size: 60.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
