import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kozarni_ecome/controller/home_controller.dart';
import 'package:kozarni_ecome/data/constant.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return Obx(
      () => controller.authorized.value
          ? Text("login user")
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
