import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/home_controller.dart';

class AppbarWithSearch extends StatelessWidget {
  const AppbarWithSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Banaswadi',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Text(
                    'Vijaya Bank Colony Extension, Annaiah Reddy Layout,',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                radius: 20,
                child: const Icon(Icons.person),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 9),
            child: TextField(
              focusNode: Get.find<HomeController>().focusNode,
              onChanged: (value) {
                Get.find<HomeController>().searchResu();
              },
              controller: Get.find<HomeController>().searchController,
              decoration: InputDecoration(
                hintText: 'Search For ...',
                hintStyle: const TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green[200]!),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
