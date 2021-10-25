import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(7),
          topRight: Radius.circular(7),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, -0.05),
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: IconButton(
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.home),
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.thLarge),
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.shoppingBag),
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.userAlt),
            ),
          ),
        ],
      ),
    );
  }
}
