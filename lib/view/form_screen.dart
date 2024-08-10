import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:project/controller/form_controller.dart';
import 'package:project/controller/home_controller.dart';
import 'package:project/model/product_add_model.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FormController>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key: globalKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                        onPressed: () {
                          Get.find<HomeController>().focusNode.unfocus();
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back)),
                  ),
                  GetBuilder<FormController>(builder: (controller) {
                    if (controller.image != null) {
                      return SizedBox(
                          height: 150,
                          width: 150,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(
                                controller.image!,
                                fit: BoxFit.cover,
                              )));
                    } else {
                      return GestureDetector(
                        onTap: () {
                          controller.clickImage();
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          radius: 50,
                          child: const Center(child: Icon(Icons.add)),
                        ),
                      );
                    }
                  }),
                  const SizedBox(height: 10),
                  AppTextFrom(
                    hint: 'First',
                    controller: controller.controller1,
                  ),
                  AppTextFrom(
                    hint: 'Second',
                    controller: controller.controller2,
                  ),
                  AppTextFrom(
                    hint: 'Third',
                    controller: controller.controller3,
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: context.width - 100,
                    child: ElevatedButton.icon(
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.grey[300])),
                      onPressed: () {
                        if (globalKey.currentState!.validate() &&
                            controller.image != null) {
                          Get.find<FormController>().submitButtonClick(
                              ProductAddModel(
                                  first: controller.controller1.text,
                                  second: controller.controller2.text,
                                  third: controller.controller3.text,
                                  image: controller.image?.path ?? ''));
                        } else {}
                      },
                      label: const Text('Submit'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppTextFrom extends StatelessWidget {
  const AppTextFrom({super.key, required this.hint, required this.controller});

  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        validator: (value) {
          if (value == '') {
            return 'Required';
          }
          return null;
        },
        controller: controller,
        decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.green[300]!))),
      ),
    );
  }
}
