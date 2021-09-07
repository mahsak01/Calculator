import 'package:calculator/constant.dart';
import 'package:calculator/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class Button extends StatelessWidget {
  String? text;
  var color;
  var colorOfText;
  var i=1.0;

  Button(this.text,this.color,this.colorOfText, [ this.i=1]);
  @override
  Widget build(BuildContext context) {
    Controller _controller = Get.put(Controller());

    return GestureDetector(
      onTap: (){
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
        if(text!.compareTo("AC")==0)
          _controller.restartInput();
        else if(text!.isEmpty){
          _controller.cleanLastInput();
        }
        else if(text!.compareTo("=")==0){
          _controller.calculationInput();
        }

        else{
          _controller.setInput(text!);
        }


      },
      child: Container(
        width: MediaQuery.of(context).size.width*i/5.5,
        height: MediaQuery.of(context).size.width/5.5,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              blurRadius: 0.5,
            )
          ]
        ),
        child: Center(
          child:(!text!.isEmpty)? Text(
            text!,
            style: TextStyle(
              color: colorOfText,fontSize: 45
            ),
          ):Transform.rotate(
              angle: 180 * math.pi / 180,
              child: Icon(Icons.backspace_outlined,size: 45,color: colorOfText)),
        ),
      ),
    );
  }
}
