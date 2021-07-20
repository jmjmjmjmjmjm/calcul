import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black45,
      ),
      home: Calkulator(),
    );
  }
}

class Calkulator extends StatelessWidget {
  const Calkulator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: h / 3,
              width: w,
              alignment: Alignment.bottomRight,
              child: Text(
                'number',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                btn(
                    w,
                    w,
                    Colors.white,
                    Text("C",
                        style: TextStyle(color: Colors.black, fontSize: 40))),
                btn(
                    w,
                    w,
                    Colors.white,
                    Text("+/-",
                        style: TextStyle(color: Colors.black, fontSize: 40))),
                btn(
                    w,
                    w,
                    Colors.white,
                    Text("%",
                        style: TextStyle(color: Colors.black, fontSize: 40))),
                btn(
                    w,
                    w,
                    Colors.yellow,
                    Text("/",
                        style: TextStyle(color: Colors.black, fontSize: 40)))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                btn(
                    w,
                    w,
                    Colors.grey,
                    Text("7",
                        style: TextStyle(color: Colors.white, fontSize: 40))),
                btn(
                    w,
                    w,
                    Colors.grey,
                    Text("8",
                        style: TextStyle(color: Colors.white, fontSize: 40))),
                btn(
                    w,
                    w,
                    Colors.grey,
                    Text("9",
                        style: TextStyle(color: Colors.white, fontSize: 40))),
                btn(
                    w,
                    w,
                    Colors.yellow,
                    Text("x",
                        style: TextStyle(color: Colors.white, fontSize: 40))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                btn(
                    w,
                    w,
                    Colors.grey,
                    Text("4",
                        style: TextStyle(color: Colors.white, fontSize: 40))),
                btn(
                    w,
                    w,
                    Colors.grey,
                    Text("5",
                        style: TextStyle(color: Colors.white, fontSize: 40))),
                btn(
                    w,
                    w,
                    Colors.grey,
                    Text("6",
                        style: TextStyle(color: Colors.white, fontSize: 40))),
                btn(
                    w,
                    w,
                    Colors.yellow,
                    Text("-",
                        style: TextStyle(color: Colors.white, fontSize: 40)))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                btn(
                    w,
                    w,
                    Colors.grey,
                    Text("1",
                        style: TextStyle(color: Colors.white, fontSize: 40))),
                btn(
                    w,
                    w,
                    Colors.grey,
                    Text("2",
                        style: TextStyle(color: Colors.white, fontSize: 40))),
                btn(
                    w,
                    w,
                    Colors.grey,
                    Text("3",
                        style: TextStyle(color: Colors.white, fontSize: 40))),
                btn(
                    w,
                    w,
                    Colors.yellow,
                    Text("+",
                        style: TextStyle(color: Colors.white, fontSize: 40)))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                btn(
                    w * 2,
                    w,
                    Colors.grey,
                    Text("0",
                        style: TextStyle(color: Colors.white, fontSize: 40))),
                btn(
                    w,
                    w,
                    Colors.grey,
                    Text(".",
                        style: TextStyle(color: Colors.white, fontSize: 40))),
                btn(
                    w,
                    w,
                    Colors.yellow,
                    Text("=",
                        style: TextStyle(color: Colors.white, fontSize: 40))),
              ],
            ),
            Row(),
          ],
        ),
      ),
    );
  }

  ClipRRect btn(double w, double h, Color color, Text text) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        color: color,
        width: w / 5,
        height: h / 5,
        child: TextButton(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
          onPressed: () => {},
          child: text,
        ),
      ),
    );
  }
}
