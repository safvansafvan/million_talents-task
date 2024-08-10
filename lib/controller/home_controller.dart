import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project/model/api_response.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  @override
  onInit() {
    fetchNames();
    super.onInit();
  }

  FocusNode focusNode = FocusNode();

  TextEditingController searchController = TextEditingController();
  List<NameResponse> namelist = [];
  Future<void> searchResu() async {
    String text = searchController.text;
    List<NameResponse> result = [];
    if (text.isEmpty) {
      fetchNames();
    } else {
      result = namelist
          .where((element) =>
              element.name!.toLowerCase().contains(text.toLowerCase()))
          .toList();
    }
    namelist = result;
    update();
  }

  Future<void> fetchNames() async {
    final url = Uri.parse('https://api.restful-api.dev/objects');
    final response = await http.get(url);

    if (response.statusCode == 200 || response.statusCode == 201) {
      log(response.statusCode.toString(), name: 'status code');
      log(response.body, name: 'response');

      final List<dynamic> resu = jsonDecode(response.body);
      namelist = resu.map((json) => NameResponse.fromJson(json)).toList();
    } else {
      log('Failed to load names', name: 'error');
    }

    log(namelist.toString(), name: 'values');
    update();
  }
}
