import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kozarni_ecome/controller/home_controller.dart';
import 'package:kozarni_ecome/data/constant.dart';

class PurchaseScreen extends StatelessWidget {
  const PurchaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return Scaffold(
      backgroundColor: scaffoldBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appBarColor,
        leading: IconButton(
          onPressed: Get.back,
          icon: Icon(
            Icons.arrow_back,
            color: appBarTitleColor,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: controller.purhcases().length,
        itemBuilder: (_, i) => ListTile(
          title: Text("invoice id: ${controller.purhcases()[i].id}"),
          subtitle: Text(controller.purhcases()[i].phone.toString()),
          trailing: IconButton(
            onPressed: () {
              print(controller.purhcases()[i].items.length);
              Get.defaultDialog(
                  title: "Detail",
                  radius: 5,
                  content: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Invoice Id"),
                          Text("${controller.purhcases()[i].id}"),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Date"),
                          Text(
                              "${controller.purhcases()[i].dateTime?.day}/${controller.purhcases()[i].dateTime?.month}/${controller.purhcases()[i].dateTime?.year}"),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Name"),
                          Text(controller.purhcases()[i].name),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Phon"),
                          Text(controller.purhcases()[i].phone.toString()),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Email"),
                          Text(controller.purhcases()[i].email),
                        ],
                      ),

                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Address"),
                          Text(controller.purhcases()[i].address),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          width: 400,
                          height: 200,
                          child: ListView.builder(
                            padding: EdgeInsets.all(0),
                            itemCount: controller.purhcases()[i].items.length,
                            itemBuilder: (_, o) => Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Item ${o + 1}"),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "color:${controller.purhcases()[i].items[o].toString().split(',')[1]}"),
                                        Text(
                                            "size:${controller.purhcases()[i].items[o].toString().split(',')[2]}")
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "${controller.getItem(
                                          controller
                                              .purhcases()[i]
                                              .items[o]
                                              .toString()
                                              .split(',')[0],
                                        ).name}x${controller.purhcases()[i].items[o].toString().split(',').last}",
                                  ),
                                ],
                              ),
                            ),
                          ))
                      // for (int o = 0;
                      //     o < controller.purhcases()[i].items.length;
                      //     o++)
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      // Text("Item ${o + 1}"),
                      // Text(
                      //   "${controller.getItem(controller.purhcases()[i].items[o]).name},",
                      // ),
                      //   ],
                      // )
                    ],
                  ));
            },
            icon: Icon(Icons.info),
          ),
        ),
      ),
    );
  }
}
