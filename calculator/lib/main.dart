
import 'package:calculator/Screen/home.dart';
import 'package:calculator/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constant.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Controller _controller = Get.put(Controller());
    return GetBuilder<Controller>(
      builder: (_) =>  MaterialApp(
        debugShowCheckedModeBanner: false,
          title: "Calculator",
            theme: themes[_controller.mode],
            home: Home()

      ),
    );
  }
}
