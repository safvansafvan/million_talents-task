import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:project/controller/form_controller.dart';
import 'package:project/controller/home_controller.dart';
import 'package:project/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FormController());
    Get.put(HomeController());
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen());
  }
}
