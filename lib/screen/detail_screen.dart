import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kozarni_ecome/data/constant.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: detailTextBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: detailBackgroundColor,
        leading: IconButton(
          onPressed: Get.back,
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            color: detailBackgroundColor,
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            width: double.infinity,
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: 20,
            ),
            decoration: BoxDecoration(
              color: detailTextBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title 1 is blah blah blah......",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      Icons.star,
                      size: 20,
                      color: homeIndicatorColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Commodo irure aliqua reprehenderit Lorem adipisicing nisi commodo quis occaecat qui.Commodo irure aliqua reprehenderit Lorem adipisicing nisi commodo quis occaecat qui.Commodo irure aliqua reprehenderit Lorem adipisicing nisi commodo quis occaecat qui.Commodo irure aliqua reprehenderit Lorem adipisicing nisi commodo quis occaecat qui.Commodo irure aliqua reprehenderit Lorem adipisicing nisi commodo quis occaecat qui.",
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: detailBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: ElevatedButton(
          style: buttonStyle,
          onPressed: () {
            Get.defaultDialog(
                titlePadding: EdgeInsets.all(0),
                contentPadding:
                    EdgeInsets.only(left: 20, right: 20, bottom: 10),
                radius: 0,
                title: '',
                content: Column(
                  children: [
                    DropdownButtonFormField(
                      hint: Text('Color'),
                      onChanged: (e) {},
                      items: [
                        'red',
                        'green',
                        'blue',
                        'pink',
                        'yellow',
                      ]
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownButtonFormField(
                      hint: Text("Size"),
                      onChanged: (e) {},
                      items: [
                        'S',
                        'M',
                        'L',
                        'XL',
                        'XXL',
                      ]
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: buttonStyle,
                      onPressed: () {},
                      child: Text("Add"),
                    )
                  ],
                ));
          },
          child: Text("Add To Cart"),
        ),
      ),
    );
  }
}
