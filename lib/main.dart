import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          scaffoldBackgroundColor: Colors.black45, splashColor: Colors.red),
      home: Calkulator(),
    );
  }
}

class Controller extends GetxController {
  final count = "0".obs;
  String num1 = "0";
  String num2 = "";
  String hap = "";

  increment(String plus) {
    if (plus == "C") {
      count.value = "0";
      num1 = "";
      num2 = "";
      hap = "";
    } else if (plus == "+/" ||
        plus == "%" ||
        plus == "/" ||
        plus == "*" ||
        plus == "-" ||
        plus == "+") {
      if (count.value.contains("/") == false &&
          count.value.contains("*") == false &&
          count.value.contains("-") == false &&
          count.value.contains("+") == false &&
          count.value.contains("%") == false &&
          count.value.contains("+/") == false) {
        num1 = count.value;
        num2 = "";
        count.value += plus;
        hap = plus;
        plus = "";
      }
    } else if (plus == "=") {
      if (num2 == "") {
        num2 = (count.value).substring(num1.length + 1); //빼기해야함 num1
      }
      num a = num.parse(num1);
      num b = num.parse(num2);
      num c = 0;

      if (hap == "%") {
        c = a % b;
        num1 = c.toString();
        count.value = c.toString();
      } else if (hap == "/") {
        c = a / b;
        num1 = c.toString();
        count.value = c.toString();
      } else if (hap == "*") {
        c = a * b;
        num1 = c.toString();
        count.value = c.toString();
      } else if (hap == "-") {
        c = a - b;
        num1 = c.toString();
        count.value = c.toString();
      } else if (hap == "+") {
        num1 = count.value;
        c = a + b;
        num1 = c.toString();
        count.value = c.toString();
      }
    } else {
      if (count.value == "0") {
        count.value = "";
      }
      count.value += plus;
    }
  }
}

class Calkulator extends StatelessWidget {
  const Calkulator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());
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
              child: Obx(
                () => Text(
                  "${c.count}",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                btn(
                    "C",
                    w,
                    w,
                    Colors.white,
                    Text("C",
                        style: TextStyle(color: Colors.black, fontSize: 40))),
                btn(
                    "+/-",
                    w,
                    w,
                    Colors.white,
                    Text("+/-",
                        style: TextStyle(color: Colors.black, fontSize: 40))),
                btn(
                    "%",
                    w,
                    w,
                    Colors.white,
                    Text("%",
                        style: TextStyle(color: Colors.black, fontSize: 40))),
                btn(
                    "/",
                    w,
                    w,
                    Colors.yellow,
                    Text("/",
                        style: TextStyle(color: Colors.black, fontSize: 40)))
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                btn(
                    "7",
                    w,
                    w,
                    Colors.grey,
                    Text("7",
                        style: TextStyle(color: Colors.white, fontSize: 40))),
                btn(
                    "8",
                    w,
                    w,
                    Colors.grey,
                    Text("8",
                        style: TextStyle(color: Colors.white, fontSize: 40))),
                btn(
                    "9",
                    w,
                    w,
                    Colors.grey,
                    Text("9",
                        style: TextStyle(color: Colors.white, fontSize: 40))),
                btn(
                    "*",
                    w,
                    w,
                    Colors.yellow,
                    Text("x",
                        style: TextStyle(color: Colors.white, fontSize: 40))),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                btn(
                    "4",
                    w,
                    w,
                    Colors.grey,
                    Text("4",
                        style: TextStyle(color: Colors.white, fontSize: 40))),
                btn(
                    "5",
                    w,
                    w,
                    Colors.grey,
                    Text("5",
                        style: TextStyle(color: Colors.white, fontSize: 40))),
                btn(
                    "6",
                    w,
                    w,
                    Colors.grey,
                    Text("6",
                        style: TextStyle(color: Colors.white, fontSize: 40))),
                btn(
                    "-",
                    w,
                    w,
                    Colors.yellow,
                    Text("-",
                        style: TextStyle(color: Colors.white, fontSize: 40)))
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                btn(
                    "1",
                    w,
                    w,
                    Colors.grey,
                    Text("1",
                        style: TextStyle(color: Colors.white, fontSize: 40))),
                btn(
                    "2",
                    w,
                    w,
                    Colors.grey,
                    Text("2",
                        style: TextStyle(color: Colors.white, fontSize: 40))),
                btn(
                    "3",
                    w,
                    w,
                    Colors.grey,
                    Text("3",
                        style: TextStyle(color: Colors.white, fontSize: 40))),
                btn(
                    "+",
                    w,
                    w,
                    Colors.yellow,
                    Text("+",
                        style: TextStyle(color: Colors.white, fontSize: 40)))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  btn(
                      "0",
                      w * 2.2,
                      w,
                      Colors.grey,
                      Text("0",
                          style: TextStyle(color: Colors.white, fontSize: 40))),
                  btn(
                      ".",
                      w,
                      w,
                      Colors.grey,
                      Text(".",
                          style: TextStyle(color: Colors.white, fontSize: 40))),
                  btn(
                      "=",
                      w,
                      w,
                      Colors.yellow,
                      Text("=",
                          style: TextStyle(color: Colors.white, fontSize: 40))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ClipRRect btn(String num, double w, double h, Color color, Text text) {
    final Controller c = Get.put(Controller());
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        color: color,
        width: w / 5,
        height: h / 5,
        child: TextButton(
          style: ButtonStyle(
            overlayColor:
                MaterialStateColor.resolveWith((states) => Colors.red),
          ),
          onPressed: () => {c.increment(num)},
          child: text,
        ),
      ),
    );
  }
}
