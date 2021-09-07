import 'package:calculator/constant.dart';
import 'package:calculator/controller/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rolling_switch/rolling_switch.dart';

class ChangeMode extends StatefulWidget {
  @override
  _ChangeModeState createState() => _ChangeModeState();
}

class _ChangeModeState extends State<ChangeMode> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    Controller _controller = Get.put(Controller());

    return GetBuilder<Controller>(
      builder: (_) => Padding(
        padding: const EdgeInsets.only(right: 20, top: 10),
        child: Container(
          width: 130,
          height: 30,
          decoration: BoxDecoration(
              gradient: _controller.mode == 0 ? darkGradient : lightGradient,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: RollingSwitch.icon(

            onChanged: (bool state) {
              (state) ? _controller.setMode(1) : _controller.setMode(0);
            },
            rollingInfoRight: const RollingIconInfo(
              icon: Icons.wb_sunny_outlined,
              iconColor: Color(0xffFF9900),
              backgroundColor: Colors.transparent,
              text: Text('DAY\nMODE'),
            ),
            rollingInfoLeft: const RollingIconInfo(
              icon: Icons.nights_stay_outlined,
              iconColor: Color(0xff120F7A),
              backgroundColor: Colors.transparent,
              text: Text('DARK\nMODE'),
            ),
          ),
        ),
      ),
    );
  }
}
