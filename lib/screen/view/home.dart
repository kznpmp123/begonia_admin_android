import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kozarni_ecome/data/constant.dart';
import 'package:kozarni_ecome/widgets/bottom_nav.dart';
import 'package:kozarni_ecome/widgets/home_category.dart';
import 'package:kozarni_ecome/widgets/home_items.dart';
import 'package:kozarni_ecome/widgets/home_pickup.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          HomePickUp(),
          HomeCategory(),
          HomeItems(),
        ],
      ),
    );
  }
}
