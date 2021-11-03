import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:get/get.dart';
import 'package:kozarni_ecome/controller/home_controller.dart';
import 'package:kozarni_ecome/controller/manage_controller.dart';
import 'package:kozarni_ecome/data/constant.dart';
import 'package:kozarni_ecome/routes/routes.dart';

class ManageItem extends StatefulWidget {
  const ManageItem({Key? key}) : super(key: key);

  @override
  State<ManageItem> createState() => _ManageItemState();
}

class _ManageItemState extends State<ManageItem> {
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    final MangeController mangeController = Get.find();
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Search",
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: homeController.items.length,
              itemBuilder: (_, i) => SwipeActionCell(
                key: ValueKey(homeController.items[i].id),
                trailingActions: [
                  SwipeAction(
                    onTap: (CompletionHandler _) async {
                      await _(true);
                      await mangeController.delete(homeController.items[i].id!);
                      setState(() {});
                    },
                    title: 'Delete',
                  ),
                  SwipeAction(
                    color: Colors.grey,
                    onTap: (CompletionHandler _) async {
                      await _(false);
                      homeController.setEditItem(homeController.items[i]);
                      Get.toNamed(uploadItemScreen);
                      setState(() {});
                    },
                    title: 'Edit',
                  ),
                ],
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  height: 100,
                  child: Card(
                    child: Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl: homeController.items[i].photo,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                homeController.items[i].name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                homeController.items[i].color
                                    .replaceAll(',', ', '),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  wordSpacing: 1,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                homeController.items[i].size
                                    .replaceAll(',', ', '),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  wordSpacing: 1,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${homeController.items[i].price}Ks",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1,
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
            ),
          )
        ],
      ),
    );
  }
}
