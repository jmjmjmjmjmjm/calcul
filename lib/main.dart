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
  final Controller c = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.bottomRight,
                child: Obx(
                  () => Text(
                    "${c.count}",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                btn(Colors.white, "C", 1),
                btn(Colors.white, "+/", 1),
                btn(Colors.white, "%", 1),
                btn(Colors.yellow, "/", 1),
              ],
            ),
            Row(
              children: [
                btn(Colors.grey, "7", 1),
                btn(Colors.grey, "8", 1),
                btn(Colors.grey, "9", 1),
                btn(Colors.yellow, "*", 1),
              ],
            ),
            Row(
              children: [
                btn(Colors.grey, "4", 1),
                btn(Colors.grey, "5", 1),
                btn(Colors.grey, "6", 1),
                btn(Colors.yellow, "-", 1),
              ],
            ),
            Row(
              children: [
                btn(Colors.grey, "1", 1),
                btn(Colors.grey, "2", 1),
                btn(Colors.grey, "3", 1),
                btn(Colors.yellow, "+", 1),
              ],
            ),
            Row(
              children: [
                btn(Colors.grey, "0", 2),
                btn(Colors.grey, ".", 1),
                btn(Colors.white, "=", 1),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Expanded btn(Color color, String text, int f) {
    return Expanded(
      flex: f,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MaterialButton(
          color: color,
          height: 80,
          onPressed: () => {c.increment(text)},
          // shape: CircleBorder(),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: Text(
            text,
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
