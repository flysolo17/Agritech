import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../styles/color_styles.dart';
import '../api_management/api_management/http_helper_with_token.dart';

class GetMethod extends GetxController {
  var index = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  images() {
    var randomItemFetcher = "https://source.unsplash.com/random?sig=$index";
  }

  var isLoading = false.obs;
  var data;
  var dataFromModel = 'MODEL'.obs;
  var userFullName;

  Future getMethodController() async {
    try {
      isLoading.value = true;
      data =
          await MyHttpHelperWithToken().fetchList('ROUTE', 'MODELJsonMethod');
      dataFromModel.value = data;
      isLoading.value = false;
      Get.delete<GetMethod>();
      return dataFromModel.value;
    } catch (e) {
      isLoading.value = true;
      print(e);
      isLoading.value = false;
      // return data;
    }
  }
}

class PostMethod extends GetxController {
  var isLoading = false.obs;
  var data;
  var dataFromModel = 'MODEL'.obs;
  var isSuccessful;
  var userEmail = '';

  Future postMethodController(details) async {
    try {
      isLoading.value = true;
      data =
          await MyHttpHelperWithToken().postItem('route', details, jsonDecode);
      dataFromModel.value = data;
      Get.snackbar("Success ", "body",
          backgroundColor: ColorStyle.blackColor,
          colorText: ColorStyle.whiteColor);
      isLoading.value = false;
      Get.delete<PostMethod>();
      return dataFromModel.value;
    } catch (e) {
      isLoading.value = true;
      print(e);
      isLoading.value = false;
    }
  }
}

class PutMethod extends GetxController {
  var isLoading = false.obs;
  var data;
  var dataFromModel = 'MODEL'.obs;
  var isSuccessful;
  var userEmail = '';

  Future putMethodController(details) async {
    try {
      isLoading.value = true;
      data = await MyHttpHelperWithToken().updateItem(
        'route',
        details,
        jsonDecode,
      );
      dataFromModel.value = data;
      Get.snackbar('Success', '${data["message"]}',
          backgroundColor: ColorStyle.blackColor,
          colorText: ColorStyle.whiteColor);
      Get.delete<PostMethod>();
      //Get.to(() => ProfilePage());
      isLoading.value = false;
      return dataFromModel.value;
    } catch (e) {
      isLoading.value = true;
      print(e);
      isLoading.value = false;
    }
  }
}
