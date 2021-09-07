import 'package:calculator/models/calculation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:calculator/constant.dart';
class Controller extends GetxController  with SingleGetTickerProviderMixin{
  Calculation calculation= new Calculation();
  int _mode=0.obs();
  String _input="".obs();
  String get input => _input;
  void setInput(String input){
    this._input+=input;
    update();
  }
  void restartInput(){
    this._input="";
    update();
  }
  void calculationInput(){
    calculation.setInput(_input);
    print(calculation.result);
    _input=calculation.result.toString();
    update();

  }
 int get mode => _mode;
 void setMode(int input){
   this._mode=input;
   update();
 }

}