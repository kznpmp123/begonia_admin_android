import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kozarni_ecome/controller/home_controller.dart';
import 'package:kozarni_ecome/data/constant.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
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
          CachedNetworkImage(
            imageUrl: controller.selectedItem.value.photo,
            // "$baseUrl$itemUrl${controller.selectedItem.value.photo}/get",
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
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
                  controller.selectedItem.value.name,
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
                      color: index <= controller.selectedItem.value.star
                          ? homeIndicatorColor
                          : Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  controller.selectedItem.value.category,
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
              contentPadding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              radius: 0,
              title: '',
              content: AddToCart(),
            );
          },
          child: Text("Add To Cart"),
        ),
      ),
    );
  }
}

class AddToCart extends StatefulWidget {
  const AddToCart({
    Key? key,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  String? colorValue;
  String? sizeValue;
  final HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return Column(
      children: [
        DropdownButtonFormField(
          value: colorValue,
          hint: Text('Color'),
          onChanged: (String? e) {
            colorValue = e;
          },
          items: controller.selectedItem.value.color
              .split(',')
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
          value: sizeValue,
          hint: Text("Size"),
          onChanged: (String? e) {
            sizeValue = e;
          },
          items: controller.selectedItem.value.size
              .split(',')
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
          onPressed: () {
            if (colorValue != null && sizeValue != null) {
              controller.addToCart(
                  controller.selectedItem.value, colorValue!, sizeValue!);
              Get.back();
            }
          },
          child: Text("Add"),
        )
      ],
    );
  }
}
