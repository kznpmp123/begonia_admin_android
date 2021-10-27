import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:kozarni_ecome/model/user.dart';
import 'package:kozarni_ecome/service/auth.dart';

class HomeController extends GetxController {
  final Auth _auth = Auth();

  final RxBool authorized = false.obs;
  final Rx<AuthUser> user = AuthUser().obs;

  final RxBool phoneState = false.obs;

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController verificationController = TextEditingController();

  Future<void> login() async {
    try {
      await _auth.login(
        phoneNumber: phoneController.text,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
        codeAutoRetrievalTimeout: (String verificationId) {},
        codeSent: (String verificationId, int? forceResendingToken) {},
        verificationFailed: (FirebaseAuthException error) {},
      );
      phoneState.value = true;
    } catch (e) {
      print("login error $e");
    }
  }

  // Future<void> confirm(ConfirmationResult result) async {
  //   try {
  //     await _auth.confirm(verificationController.text, result);
  //   } catch (e) {
  //     print("confirm error is $e");
  //   }
  // }

  @override
  void onInit() {
    super.onInit();
    _auth.onAuthChange().listen((_) {
      user.value = AuthUser(user: _);
      if (_ == null) {
        authorized.value = false;
      } else {
        authorized.value = true;
      }
    });
  }

  final RxInt navIndex = 0.obs;

  void changeNav(int i) {
    navIndex.value = i;
  }

  final RxString category = 'all'.obs;

  void changeCat(String name) {
    category.value = name;
  }

  final RxBool isSearch = false.obs;

  void search() => isSearch.value = !isSearch.value;
  void searchItem(String name) => isSearch.value = !isSearch.value;
}
