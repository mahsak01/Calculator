import 'package:calculator/models/calculation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:calculator/constant.dart';
class Controller extends GetxController  with SingleGetTickerProviderMixin{
  Calculation calculation= new Calculation();
  int _mode=0.obs();
  String _input="".obs();
  String get input => _input;

  void cleanLastInput(){
    String temp=_input;
    _input="";
    for(int i=0 ; i<temp.length-1; i++){
      _input+=temp[i];
    }
    update();
  }
  void setInput(String input){
    if(!_input.isEmpty&&calculation.checkSign(_input[_input.length-1]) && calculation.checkSign(input))
      cleanLastInput();
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