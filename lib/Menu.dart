import 'package:flutter/material.dart';
import 'package:next_gen_calc/Build.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Color(0xffB32B1E),
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: FlatButton(
                    onPressed: () {
                      _launchURL();
                    },
                    child: Text(
                      "About The Developer",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ))),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: FlatButton(
                    onPressed: () {
                      /*showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            // Retrieve the text the that user has entered by using the
                            // TextEditingController.
                            content: Text("yo"),
                          );
                        },
                      );*/
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Build()),
                      );
                    },
                    child: Text(
                      "About The Build",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ))),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: FlatButton(
                    onPressed: () {
                      _launchURL();
                    },
                    child: Text(
                      "Privacy Policy",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ))),
          ],
        ),
      ),
    );
  }
  _launchURL() async {
    const url = 'https://www.vamshiprasad.ga';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}


