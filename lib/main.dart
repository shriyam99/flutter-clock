import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}
String message = 'Good Morning!!';
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
var now = new DateTime.now();
class _MyAppState extends State<MyApp> {
  Timer _everySecond;

  void updateMessage(){
    if(now.hour<6 || now.hour>=22)
      message = 'Have a good sleep!!';
    else if(now.hour>=6 && now.hour<=12)
      message = 'Good Morning!!';
    else if(now.hour>12 && now.hour<18)
      message = 'Good Afternoon!!';
    else
      message = 'Good evening!!';
  }

  @override
  void initState() {
    super.initState();
    updateMessage();
    _everySecond = Timer.periodic(Duration(milliseconds: 100), (Timer t) {
      setState(() {
        now = new DateTime.now();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    // print(now.second);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple,
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.pink, Colors.amber],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
              ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
               Text(
                '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}:${now.millisecond.toString().padLeft(3, '0')}',
                style: TextStyle(
                  color: Colors.orange.shade100,
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SourceSansPro',
                  letterSpacing: 3.0,
                ),
              ),
             ],),
             Text(
                '${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year.toString().padLeft(2, '0')}',
                style: TextStyle(
                  color: Colors.deepPurple.shade100,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SourceSansPro',
                  letterSpacing: 3.0,
                ),
              ),
            Text(message,
            style: TextStyle(
              color: Colors.grey.shade200,
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Pacifico',
            )),
            ],
          ),
        )),
      ),
    );
  }
}
//                Text('Shriyam Tripathi',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 35.0,
//                     fontWeight: FontWeight.bold,
//                     fontFamily: 'Pacifico',
//                   )),
//               Text(
//                 'FLUTTER DEVELOPER',
//                 style: TextStyle(
//                   color: Colors.deepPurple.shade100,
//                   fontSize: 20.0,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: 'SourceSansPro',
//                   letterSpacing: 3.0,
//                 ),
//               ),