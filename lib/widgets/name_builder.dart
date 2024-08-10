import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/home_controller.dart';

class NameBuilder extends StatelessWidget {
  const NameBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Container(
        height: 200,
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: controller.namelist.length,
          itemBuilder: (context, index) {
            final value = controller.namelist[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Text(
                value.name ?? '',
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
            );
          },
        ),
      );
    });
  }
}
