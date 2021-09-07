import 'package:flutter/material.dart';

List<ThemeData> themes=[darkTheme,lightTheme];

ScrollController scrollController = new ScrollController();

ThemeData darkTheme = ThemeData(
    backgroundColor: Color(0xff222F3D),
    splashColor: Colors.transparent,
    primaryColor: Color(0xff0099ff),
    accentColor: Color(0xff9ED8FF),
    shadowColor: Colors.white,
    cardColor: Color(0xff222F3D),
    buttonColor: Color(0xffDDE6E8),
    focusColor: Color(0xff120F7A)

    
);

ThemeData lightTheme = ThemeData(
    backgroundColor: Color(0xffffffff),
    splashColor: Colors.transparent,
    primaryColor: Color(0xffFF9900),
    accentColor: Color(0xffFFE1B8),
    shadowColor: Colors.black,
    cardColor: Color(0xff222F3D),
    focusColor: Color(0xff222F3D),

    buttonColor: Color(0xffDDE6E8)
);

const darkGradient = LinearGradient(
    colors: [Color(0xff120F7A), Color(0xff0099ff)],
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
);

const lightGradient = LinearGradient(
    colors: [Color(0xffFF9900), Color(0xffFFE1B8)],
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
);
