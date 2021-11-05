import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:kozarni_ecome/controller/home_controller.dart';
import 'package:kozarni_ecome/data/constant.dart';
import 'package:kozarni_ecome/routes/routes.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return Column(
      children: [
        Expanded(
          child: Obx(
            () => ListView.builder(
              padding: EdgeInsets.only(top: 10, bottom: 20),
              itemCount: controller.myCart.length,
              itemBuilder: (_, i) => Card(
                margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        bottomLeft: Radius.circular(6),
                      ),
                      child: CachedNetworkImage(
                        imageUrl:
                            controller.getItem(controller.myCart[i].id).photo,
                        // "$baseUrl$itemUrl${controller.getItem(controller.myCart[i].id).photo}/get",
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.getItem(controller.myCart[i].id).name,
                              style: TextStyle(
                                fontSize: 14,
                              )),
                          SizedBox(height: 5),
                          Text("color: ${controller.myCart[i].color}"),
                          SizedBox(height: 5),
                          Text("size: ${controller.myCart[i].size}"),
                          SizedBox(height: 5),
                          Text(
                            "price: ${controller.getItem(controller.myCart[i].id).price}",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              controller.remove(controller.myCart[i]);
                            },
                            icon: Icon(Icons.remove),
                          ),
                          Text(controller.myCart[i].count.toString()),
                          IconButton(
                            onPressed: () {
                              controller.addCount(controller.myCart[i]);
                            },
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 20),
          height: 200,
          child: Card(
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                    ),
                    child: Text(
                      'Cart Total',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sub Toal:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "${controller.subTotal}Ks",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Shipping",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          " ${controller.shipping()}Ks",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    margin: EdgeInsets.only(
                      left: 20,
                      top: 20,
                      right: 20,
                    ),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(25, 25, 25, 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Payable Toal:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${controller.subTotal + controller.shipping()}Ks",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 45,
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(homeIndicatorColor),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            onPressed: () {
              if (controller.myCart.isNotEmpty) {
                Get.toNamed(checkOutScreen);
              } else {
                Get.snackbar('Error', "Cart is empty");
              }
            },
            child: Text("Proceed To Checkout"),
          ),
        )
      ],
    );
  }
}
