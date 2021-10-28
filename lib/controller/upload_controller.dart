import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';

class UploadController extends GetxController {
  final RxBool isUploading = false.obs;

  final ImagePicker _imagePicker = ImagePicker();

  final RxString filePath = ''.obs;

  final GlobalKey<FormState> form = GlobalKey();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController starController = TextEditingController();

  Future<void> pickImage() async {
    try {
      final XFile? _file =
          await _imagePicker.pickImage(source: ImageSource.gallery);
      if (_file != null) filePath.value = _file.path;
    } catch (e) {
      print("pickImage error $e");
    }
  }

  String? validator(String? data) => data?.isEmpty == true ? 'empty' : null;

  Future<void> upload() async {
    if (isUploading.value) return;
    try {
      isUploading.value = true;
    } catch (e) {}
  }
}
