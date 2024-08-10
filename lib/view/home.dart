import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:project/controller/form_controller.dart';
import 'package:project/controller/home_controller.dart';
import 'package:project/view/form_screen.dart';
import 'package:project/widgets/appbar.dart';
import 'package:project/widgets/name_builder.dart';
import 'package:project/widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Get.find<HomeController>().focusNode.unfocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppbarWithSearch(),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: NameBuilder(),
              ),
              SizedBox(height: 20),
              ProductCard(),
              ProductCard(),
              ProductFormBuilder()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[300],
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FormScreen(),
              ));
        },
      ),
    );
  }
}

class ProductFormBuilder extends StatelessWidget {
  const ProductFormBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormController>(builder: (controller) {
      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: controller.productDetails.length,
        itemBuilder: (context, index) {
          final values = controller.productDetails[index];
          return ProductBuildCard(
            image: values['image'],
            first: values['first'],
            second: values['second'],
            third: values['third'],
          );
        },
      );
    });
  }
}

class ProductBuildCard extends StatelessWidget {
  const ProductBuildCard(
      {super.key,
      required this.image,
      required this.first,
      required this.second,
      required this.third});

  final String image;
  final String first;
  final String second;
  final String third;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey[200]),
      child: Row(
        children: [
          GetBuilder<FormController>(builder: (controller) {
            if (image != '') {
              return Container(
                height: 100,
                width: 100,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: FileImage(
                          File(image),
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
              );
            } else {
              return Container(
                height: 100,
                width: 100,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
              );
            }
          }),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                first,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              Text(
                second,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              Text(
                third,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: 40,
                width: 220,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}
