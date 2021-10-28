import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kozarni_ecome/data/constant.dart';
import 'package:kozarni_ecome/model/user.dart';
import 'package:kozarni_ecome/service/api.dart';
import 'package:kozarni_ecome/service/auth.dart';
import 'package:kozarni_ecome/service/database.dart';

class HomeController extends GetxController {
  final Auth _auth = Auth();
  final Database _database = Database();
  final Api _api = Api();
  final ImagePicker _imagePicker = ImagePicker();

  final RxBool authorized = false.obs;
  final Rx<AuthUser> user = AuthUser().obs;

  final RxBool phoneState = false.obs;

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController verificationController = TextEditingController();

  final RxString _codeSentId = ''.obs;
  final RxInt _codeSentToken = 0.obs;

  Future<void> login() async {
    try {
      if (_codeSentId.value.isNotEmpty || phoneState.value) {
        await confirm();
        return;
      }
      await _auth.login(
        phoneNumber: phoneController.text,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
        codeAutoRetrievalTimeout: (String verificationId) {},
        codeSent: (String verificationId, int? forceResendingToken) {
          _codeSentId.value = verificationId;
          _codeSentToken.value = forceResendingToken ?? 0;
          update([_codeSentId, _codeSentToken]);
        },
        verificationFailed: (FirebaseAuthException error) {},
      );
      phoneState.value = true;
    } catch (e) {
      print("login error $e");
    }
  }

  Future<void> confirm() async {
    try {
      await _auth.loginWithCerdential(PhoneAuthProvider.credential(
        verificationId: _codeSentId.value,
        smsCode: verificationController.text,
      ));
      _codeSentId.value = '';
      phoneState.value = false;
      phoneController.clear();
      verificationController.clear();
    } catch (e) {
      print("confirm error is $e");
    }
  }

  Future<void> logout() async {
    try {
      await _auth.logout();
    } catch (e) {
      print("logout error is $e");
    }
  }

  Future<void> uploadProfile() async {
    try {
      final XFile? _file =
          await _imagePicker.pickImage(source: ImageSource.gallery);

      if (_file != null) {
        await _api.uploadFile(
          _file.path,
          fileName: user.value.user?.uid,
          folder: profileUrl,
        );
        await _database.write(
          profileCollection,
          data: {
            'link': user.value.user?.uid,
          },
          path: user.value.user?.uid,
        );
        user.value.update(
          newProfileImage: '$baseUrl$profileUrl${user.value.user?.uid}',
        );
        update([user]);
      }
    } catch (e) {
      print("profile upload error $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    _auth.onAuthChange().listen((_) async {
      user.value = AuthUser(user: _);
      if (_ == null) {
        authorized.value = false;
      } else {
        authorized.value = true;
        // await _database.write(
        //   userCollection,
        //   data: {
        //     'uid': _.uid,
        //     'phone': _.phoneNumber,
        //   },
        //   path: _.uid,
        // );
        final DocumentSnapshot<Map<String, dynamic>> _data =
            await _database.read(userCollection, path: _.uid);
        user.value = user.value.update(
          newIsAdmin: _data.exists,
        );
        final DocumentSnapshot<Map<String, dynamic>> _profile =
            await _database.read(profileCollection, path: _.uid);
        user.value = user.value.update(
          newProfileImage: _profile.data()?['link'],
        );
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
