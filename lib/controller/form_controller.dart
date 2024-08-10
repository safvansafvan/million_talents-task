import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/model/product_add_model.dart';

class FormController extends GetxController {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();

  List<Map<String, dynamic>> productDetails = [];

  void submitButtonClick(ProductAddModel value) {
    productDetails.add(value.toJson());
    log(productDetails.toString());
    clearValues();
    update();
  }

  File? image;
  Future<void> clickImage() async {
    final photo = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (photo == null) {
      return;
    } else {
      final photoTemp = File(photo.path);
      image = photoTemp;
    }
    update();
  }

  void clearValues() {
    controller1.clear();
    controller2.clear();
    controller3.clear();
    image = null;
  }
}
