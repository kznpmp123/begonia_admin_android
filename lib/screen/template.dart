import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kozarni_ecome/data/constant.dart';
import 'package:kozarni_ecome/screen/view/category.dart';
import 'package:kozarni_ecome/screen/view/home.dart';
import 'package:kozarni_ecome/widgets/bottom_nav.dart';
import 'package:url_launcher/url_launcher.dart';

List<Widget> _template = [
  HomeView(),
  CategoryView(),
];

class Template extends StatelessWidget {
  const Template({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackground,
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 0,
        title: Text(
          "Ehay",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: appBarTitleColor,
          ),
        ),
        // centerTitle: true,
        actions: [
          // InkWell(
          //   onTap: () {
          //     ///TODO
          //   },
          //   child: Container(
          //     margin: EdgeInsets.only(right: 10, top: 10, bottom: 10),
          //     padding: EdgeInsets.only(left: 10, right: 10),
          //     alignment: Alignment.center,
          //     decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(7),
          //         boxShadow: [
          //           BoxShadow(
          //             color: Colors.grey[200]!,
          //             spreadRadius: 1,
          //             offset: Offset(0, 1),
          //           )
          //         ]),
          //     child: Icon(
          //       Icons.search,
          //       color: Colors.black,
          //     ),
          //   ),
          // )
          Container(
            margin: EdgeInsets.only(
              top: 7,
              bottom: 10,
              right: 7,
            ),
            width: 40,
            child: ElevatedButton(
              style: ButtonStyle(
                alignment: Alignment.center,
                padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80),
                )),
                overlayColor: MaterialStateProperty.all(Colors.black12),
              ),
              onPressed: () {},
              child: FaIcon(
                FontAwesomeIcons.search,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 7,
              bottom: 10,
              right: 7,
            ),
            width: 40,
            child: ElevatedButton(
              style: ButtonStyle(
                alignment: Alignment.center,
                padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80),
                )),
                overlayColor: MaterialStateProperty.all(Colors.black12),
              ),
              onPressed: () async {
                try {
                  await launch('https://m.me/begoniazue');
                } catch (e) {
                  print(e);
                }
              },
              child: FaIcon(
                FontAwesomeIcons.facebookMessenger,
                color: Colors.blue,
                size: 20,
              ),
            ),
          ),
          // Container(
          //   margin: EdgeInsets.only(
          //     top: 7,
          //     bottom: 10,
          //     right: 7,
          //   ),
          //   child: ElevatedButton(
          //     style: ButtonStyle(
          //       backgroundColor: MaterialStateProperty.all(Colors.white),
          //       overlayColor: MaterialStateProperty.all(Colors.black12),
          //     ),
          //     onPressed: () async {
          //       try {
          //         await launch('https://m.me/begoniazue');
          //       } catch (e) {
          //         print(e);
          //       }
          //     },
          //     child: FaIcon(
          //       FontAwesomeIcons.facebookMessenger,
          //       color: Colors.blue,
          //     ),
          //   ),
          // )
        ],
      ),
      body: _template[1],
      bottomNavigationBar: BottomNav(),
    );
  }
}
