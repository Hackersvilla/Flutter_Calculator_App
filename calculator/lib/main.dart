//Claculator App
import 'package:flutter/material.dart';

void main() {
  runApp(app());
}

class app extends StatefulWidget {
  @override
  _appState createState() => _appState();
}

class _appState extends State<app> {
  int firstnum;
  int secondnum;
  String texttodisplay = "";
  String res;
  String opertortoperform;

  void btn_click(String value) {
    if (value == "C") {
      firstnum = 0;
      secondnum = 0;
      texttodisplay = "";
      res = "";
    } else if (value == "+" || value == "-" || value == "x" || value == "/") {
      firstnum = int.parse(texttodisplay);
      res = "";
      opertortoperform = value;
    } else if (value == "=") {
      secondnum = int.parse(texttodisplay);

      if (secondnum == "+") {
        res = (firstnum + secondnum).toString();
      }
      if (secondnum == "-") {
        res = (firstnum - secondnum).toString();
      }
      if (secondnum == "x") {
        res = (firstnum * secondnum).toString();
      }
      if (secondnum == "/") {
        res = (firstnum / secondnum).toString();
      }
    } else {
      res = int.parse(texttodisplay + value).toString();
    }

    setState(() {
      texttodisplay = res;
    });
  }

  Widget coustombutton(String value) {
    return Expanded(
        child: OutlineButton(
      padding: EdgeInsets.all(40.0),
      onPressed: () => btn_click(value),
      child: Text(
        "$value",
        style: TextStyle(fontSize: 25.0),
      ),
    ));
  }

  Widget output_screen() {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomRight,
        padding: EdgeInsets.all(20.0),
        child: Text(
          "$texttodisplay",
          style: TextStyle(
            fontSize: 50.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Calculator",
        home: Scaffold(
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                output_screen(),
                Row(
                  children: [
                    coustombutton("9"),
                    coustombutton("8"),
                    coustombutton("7"),
                    coustombutton("+"),
                  ],
                ),
                Row(
                  children: [
                    coustombutton("6"),
                    coustombutton("5"),
                    coustombutton("4"),
                    coustombutton("-"),
                  ],
                ),
                Row(
                  children: [
                    coustombutton("3"),
                    coustombutton("2"),
                    coustombutton("1"),
                    coustombutton("x"),
                  ],
                ),
                Row(
                  children: [
                    coustombutton("C"),
                    coustombutton("0"),
                    coustombutton("="),
                    coustombutton("/"),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
