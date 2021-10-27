import 'package:flutter/material.dart';

const Color scaffoldBackground = Color.fromRGBO(246, 248, 248, 1);
const Color appBarColor = Color.fromRGBO(234, 234, 234, 1);
const Color appBarTitleColor = Color.fromRGBO(19, 19, 19, 1);
const Color homeIndicatorColor = Color.fromRGBO(247, 98, 16, 1);
const Color detailBackgroundColor = Color.fromRGBO(255, 255, 255, 1);
const Color detailTextBackgroundColor = Color.fromRGBO(245, 245, 245, 1);
ButtonStyle buttonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(homeIndicatorColor),
);
