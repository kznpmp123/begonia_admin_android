import 'package:flutter/material.dart';
import 'package:kozarni_ecome/data/constant.dart';

List<String> category = [
  'all',
  'machine tools',
  'man',
  'woman',
  'all',
  'machine tools',
  'man',
  'woman',
];

class HomeCategory extends StatelessWidget {
  const HomeCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,

      // color: Colors.green,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (_, i) => Container(
          margin: EdgeInsets.only(
            top: 6,
            bottom: 6,
            right: 20,
          ),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(homeIndicatorColor),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            onPressed: () {},
            child: Text(
              category[i],
            ),
          ),
        ),
      ),
    );
  }
}


// Container(
//           margin: EdgeInsets.only(
//             right: 10,
//             top: 7,
//             bottom: 7,
//           ),
//           padding: EdgeInsets.only(left: 20, right: 20),
//           height: 50,
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             color: homeIndicatorColor,
//             borderRadius: BorderRadius.circular(30),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black26,
//                 spreadRadius: 1,
//                 blurRadius: 1,
//                 offset: Offset(0, 1),
//               )
//             ],
//           ),
//           child: Text(
//             category[i],
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 16,
//             ),
//           ),
//         )
