import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kozarni_ecome/controller/upload_controller.dart';
import 'package:kozarni_ecome/data/constant.dart';

class UploadItem extends StatelessWidget {
  const UploadItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UploadController controller = Get.find();
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
      body: Form(
        key: controller.form,
        child: ListView(
          children: [
            GestureDetector(
              onTap: controller.pickImage,
              child: Container(
                width: double.infinity,
                height: 200,
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                child: Card(
                  child: Obx(
                    () => controller.filePath.isEmpty
                        ? Center(
                            child: Icon(
                              Icons.image,
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                            child: Image.file(
                              File(
                                controller.filePath.value,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: TextFormField(
                controller: controller.nameController,
                decoration: InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: TextFormField(
                controller: controller.priceController,
                validator: controller.validator,
                decoration: InputDecoration(
                  hintText: 'Price',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: TextFormField(
                controller: controller.colorController,
                validator: controller.validator,
                decoration: InputDecoration(
                  hintText: 'Color',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: TextFormField(
                controller: controller.sizeController,
                validator: controller.validator,
                decoration: InputDecoration(
                  hintText: 'Size',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: TextFormField(
                controller: controller.starController,
                validator: controller.validator,
                decoration: InputDecoration(
                  hintText: 'Star',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
              child: ElevatedButton(
                style: buttonStyle,
                onPressed: () {},
                child: Text("upload"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
