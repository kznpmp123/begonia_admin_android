import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kozarni_ecome/controller/home_controller.dart';
import 'package:kozarni_ecome/data/constant.dart';
import 'package:kozarni_ecome/routes/routes.dart';
import 'package:kozarni_ecome/widgets/bottom_nav.dart';
import 'package:kozarni_ecome/widgets/home_category.dart';
import 'package:kozarni_ecome/widgets/home_items.dart';
import 'package:kozarni_ecome/widgets/home_pickup.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return Scaffold(
      body: Obx(
        () => controller.isSearch.value
            ? GridView.builder(
                padding: EdgeInsets.only(
                  top: 15,
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.72,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: controller.searchitems.length,
                itemBuilder: (_, i) => GestureDetector(
                  onTap: () {
                    controller.setSelectedItem(controller.searchitems[i]);
                    Get.toNamed(detailScreen);
                  },
                  child: Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        Expanded(
                          child: CachedNetworkImage(
                            imageUrl: controller.searchitems[i].photo,
                            // "$baseUrl$itemUrl${controller.getItems()[i].photo}/get",
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                              top: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.searchitems[i].name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: List.generate(
                                    5,
                                    (index) => Icon(
                                      Icons.star,
                                      size: 15,
                                      color: index <=
                                              controller.searchitems[i].star
                                          ? homeIndicatorColor
                                          : Colors.grey,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${controller.searchitems[i].price} Ks",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: homeIndicatorColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                // Text(
                                //   "In stock (7)",
                                //   style: TextStyle(
                                //     fontSize: 16,
                                //     fontWeight: FontWeight.w700,
                                //     color: Colors.green,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 40,
                          margin:
                              EdgeInsets.only(bottom: 10, right: 20, left: 20),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(homeIndicatorColor),
                            ),
                            onPressed: () {
                              Get.defaultDialog(
                                titlePadding: EdgeInsets.all(0),
                                contentPadding: EdgeInsets.only(
                                    left: 20, right: 20, bottom: 10),
                                radius: 0,
                                title: '',
                                content: AddToCart(
                                  itemModel: controller.searchitems[i],
                                ),
                              );
                            },
                            child: Text('Add'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            : ListView(
                children: [
                  HomePickUp(),
                  HomeCategory(),
                  HomeItems(),
                ],
              ),
      ),
    );
  }
}
