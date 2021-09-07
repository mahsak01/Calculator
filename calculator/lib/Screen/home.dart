import 'package:calculator/controller/controller.dart';
import 'package:calculator/widget/button.dart';
import 'package:calculator/widget/change_mode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Controller _controller = Get.put(Controller());

    return GetBuilder<Controller>(
      builder: (_) =>  Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text("Calculator",style: TextStyle(color: Theme.of(context).shadowColor,fontSize: 40),),
          ),
          elevation: 0,
          actions: [
            ChangeMode()
          ] ,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color:Theme.of(context).backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(flex: 4,),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/8,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Theme.of(context).buttonColor,
                    ),
                    child: NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (overscroll) {
                        overscroll.disallowGlow();
                        return true;
                      },
                      child: ListView(
                        reverse: true,
                        scrollDirection: Axis.vertical,

                        children: [
                          Padding(
                            
                            padding: const EdgeInsets.all(5),
                            child: Text(_controller.input,style: TextStyle(color: Colors.black, fontSize: 40),textAlign: TextAlign.end,),
                          ),
                        ],
                      ),
                    ),

                  ),
                ),
                Spacer(flex: 2,),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Button("AC", Theme.of(context).buttonColor, Theme.of(context).cardColor),
                    Button("+/-", Theme.of(context).accentColor, Theme.of(context).cardColor),
                    Button("%", Theme.of(context).accentColor, Theme.of(context).cardColor),
                    Button("/", Theme.of(context).accentColor, Theme.of(context).cardColor),

                  ],
                ),
                Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Button("7", Theme.of(context).primaryColor, Colors.white),
                    Button("8", Theme.of(context).primaryColor,  Colors.white),
                    Button("9", Theme.of(context).primaryColor,  Colors.white),
                    Button("x", Theme.of(context).accentColor, Theme.of(context).cardColor),

                  ],
                ),
                Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Button("4", Theme.of(context).primaryColor, Colors.white),
                    Button("5", Theme.of(context).primaryColor,  Colors.white),
                    Button("6", Theme.of(context).primaryColor,  Colors.white),
                    Button("-", Theme.of(context).accentColor, Theme.of(context).cardColor),

                  ],
                ),
                Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Button("1", Theme.of(context).primaryColor, Colors.white),
                    Button("2", Theme.of(context).primaryColor,  Colors.white),
                    Button("3", Theme.of(context).primaryColor,  Colors.white),
                    Button("+", Theme.of(context).accentColor, Theme.of(context).cardColor),

                  ],
                ),
                Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Button("0", Theme.of(context).primaryColor, Colors.white,2.2),
                    Button(".", Theme.of(context).primaryColor,  Colors.white),
                    Button("=", Theme.of(context).focusColor, Colors.white),

                  ],
                ),
              ],
            ),
          ),
        ),


      ),
    );
  }
}
