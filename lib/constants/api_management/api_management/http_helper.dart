import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

import '../../../styles/color_styles.dart';
import 'api_routes.dart';

const String baseUrl = BASE_URL;
var statusCode;

class MyHttpHelper {
  static var client = http.Client();

  //GET METHOD FOR LIST OF ITEMS
  Future<dynamic> fetchList({route, decodeType}) async {
    try {
      var url = Uri.parse(route);
      var items;
      //now performing actual function of get item
      var response = await client.get(url);
      //print(response.body);
      //check to see if it is successful
      if (response.statusCode == 200) {
        //get the data from the server
        String jsonString = response.body;
        //convert the data to readable item. in this case List<map>
        items = decodeType(jsonString);
        return items;
      } else {
        var errorMessage = jsonDecode(response.body);
        Get.snackbar('Sorry', errorMessage['message'],
            backgroundColor: ColorStyle.blackColor, colorText: ColorStyle.whiteColor);
        throw errorMessage["message"];
      }
    } catch (e) {
      rethrow;
    }
  }

//GET METHOD FOR SINGLE ITEM
  Future<dynamic> getItem({route, decodeType}) async {
    try {
      var url = Uri.parse(route);
      var item;
      //now performing actual function of get item
      var response = await client.get(url);
      print(response.body);
      //check to see if it is successful
      if (response.statusCode == 200) {
        //get the data from the server
        String jsonString = response.body;
        //convert the data to readable item. in this case List<map>
        item = decodeType(jsonString);
        return item;
      } else {
        var errorMessage = jsonDecode(response.body);
        Get.snackbar('Sorry', errorMessage['message'],
            backgroundColor: ColorStyle.blackColor, colorText: ColorStyle.whiteColor);
        throw errorMessage["message"];
      }
    } catch (e) {
      rethrow;
    }
  }

  //POST METHOD FOR AN ITEM
  Future<dynamic> postItem({
    route,
    data,
    decodeType,
  }) async {
    try {
      var item;
      var url = Uri.parse(route);
      //you always need to convert the payload that the post is sending to json
      var _payload = json.encode(data);

      //and if the endpoint has headers and authorization requirement
      var _headers = {
        'content-type': 'application/json',
      };
      //now performing actual function of post item
      var response = await client.post(url, body: _payload, headers: _headers);
      //check to see if it is successful
      if (response.statusCode == 201 || response.statusCode == 402) {
        //get the data from the server
        statusCode = response.statusCode;
        String jsonString = response.body;
        //convert the data to readable item.
        item = decodeType(jsonString);
        return item;
      } else {
        var errorMessage = jsonDecode(response.body);
        Get.snackbar('Sorry', errorMessage['message'],
            backgroundColor: ColorStyle.blackColor, colorText: ColorStyle.whiteColor);
        throw errorMessage["message"];
      }
    } catch (e) {
      rethrow;
    }
  }

  //PUT METHOD FOR UPDATING AN ITEM
  Future<dynamic> updateItem(route, data, decodeType) async {
    try {
      var item;
      var url = Uri.parse(route);
      //you always need to convert the payload that the post is sending to json
      var _payload = json.encode(data);

      //and if the endpoint has headers and authorization requirement
      var _headers = {
        'content-type': 'application/json',
      };
      //now performing actual function of get item
      var response = await client.put(url, body: _payload, headers: _headers);
      print(response.body);
      //check to see if it is successful
      if (response.statusCode == 200) {
        //get the data from the server
        String jsonString = response.body;
        //convert the data to readable item.
        item = decodeType(jsonString);
        return item;
      } else {
        var errorMessage = jsonDecode(response.body);
        Get.snackbar('Sorry', errorMessage['message'],
            backgroundColor: ColorStyle.blackColor, colorText: ColorStyle.whiteColor);
        throw errorMessage["message"];
      }
    } catch (e) {
      rethrow;
    }
  }

  //DELETE METHOD FOR DELETING AN ITEM
  Future<dynamic> deleteItem({route, data, decodeType}) async {
    try {
      var item;
      var url = Uri.parse(route);
      //you always need to convert the payload that the post is sending to json
      var _payload = json.encode(data);

      //and if the endpoint has headers and authorization requirement
      var _headers = {
        'content-type': 'application/json',
      };
      //now performing actual function of get item
      var response = await client.delete(url, body: _payload, headers: _headers);
      print(response.body);
      //check to see if it is successful
      if (response.statusCode == 200) {
        //get the data from the server
        String jsonString = response.body;
        //convert the data to readable item.
        item = decodeType(jsonString);
        return item;
      } else {
        var errorMessage = jsonDecode(response.body);
        var snackbar = Get.snackbar('Sorry', errorMessage['message'],
            backgroundColor: ColorStyle.blackColor, colorText: ColorStyle.whiteColor);
        throw errorMessage["message"];
      }
    } catch (e) {
      rethrow;
    }
  }
}
