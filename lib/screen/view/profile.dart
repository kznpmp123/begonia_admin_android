import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kozarni_ecome/controller/home_controller.dart';
import 'package:kozarni_ecome/data/constant.dart';
import 'package:kozarni_ecome/routes/routes.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return Obx(
      () => controller.authorized.value
          ? _LoginUser()
          : ListView(
              children: [
                SizedBox(
                  height: 50,
                ),
                FlutterLogo(
                  size: 100,
                  // style: FlutterLogoStyle.stacked,
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: TextFormField(
                    controller: controller.phoneState.value
                        ? controller.verificationController
                        : controller.phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: controller.phoneState.value
                          ? 'Enter your code'
                          : 'Phone Number(+9599***)',
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(homeIndicatorColor),
                    ),
                    onPressed: controller.login,
                    child: Text(
                        controller.phoneState.value ? 'Verify' : 'Send Code'),
                  ),
                )
              ],
            ),
    );
  }
}

class _LoginUser extends StatelessWidget {
  const _LoginUser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController _controller = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 200,
          padding: EdgeInsets.only(left: 20, right: 20),
          margin: EdgeInsets.only(top: 20),
          child: Card(
            child: Column(
              children: [
                GestureDetector(
                  onTap: _controller.uploadProfile,
                  child: Obx(
                    () => _controller.user.value.profileImage == null
                        ? Container(
                            width: 100,
                            height: 100,
                            margin: EdgeInsets.only(
                              top: 20,
                              bottom: 20,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              bottom: 20,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                              child: Image.asset(
                                "assets/profile.JPG",
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              // CachedNetworkImage(
                              //   imageUrl:
                              //       "$baseUrl$profileUrl${_controller.user.value.profileImage!}/get",
                              //   width: 100,
                              //   height: 100,
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                          ),
                  ),
                ),
                Obx(
                  () => Text(
                    _controller.user.value.user?.phoneNumber ?? '',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Obx(
          () => _controller.user.value.isAdmin
              ? Expanded(child: _AdminPanel())
              : Spacer(),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Center(
            child: GestureDetector(
              onTap: _controller.logout,
              child: Text(
                "Logout",
                style: TextStyle(
                  fontSize: 16,
                  color: homeIndicatorColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _AdminPanel extends StatelessWidget {
  const _AdminPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 40, bottom: 20, left: 20, right: 20),
          child: Text(
            "Admin Feature",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(uploadItemScreen);
          },
          child: Container(
            height: 60,
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Upload Item"),
                    Icon(Icons.upload),
                  ],
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(mangeItemScreen);
          },
          child: Container(
            height: 60,
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Manage Item"),
                    Icon(Icons.edit),
                  ],
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(purchaseScreen);
          },
          child: Container(
            height: 60,
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Purchase"),
                    Icon(Icons.shop),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
