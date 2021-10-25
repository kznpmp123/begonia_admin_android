import 'package:flutter/material.dart';
import 'package:kozarni_ecome/screen/view/home.dart';

import 'screen/template.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Template(),
    );
  }
}
