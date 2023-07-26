import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';
import '../../../modules/authentication/view/loginPage.dart';
import '../../../styles/color_styles.dart';
import 'api_routes.dart';

const String baseUrl = BASE_URL;
var statusCodeWithToken;

class MyHttpHelperWithToken {
  var token; //Get.find<UpdatedUserDetails>();
  static var client = http.Client();
  late final prefs;

  Future<void> getTokenDetails() async {
    prefs = await SharedPreferences.getInstance();
    token = prefs.getString('userToken');
  }

  //GET METHOD FOR LIST OF ITEMS
  Future<dynamic> fetchList(route, decodeType) async {
    await getTokenDetails();
    try {
      var url = Uri.parse(route);
      var items;

      var _headers = {
        'Authorization': '$token',
        'content-type': 'application/json',
      };
      //now performing actual function of get item
      var response = await client.get(url, headers: _headers);
      statusCodeWithToken = response.statusCode;
      if (response.statusCode == 401) {
        Get.offAll(() => LoginPage());
        Get.snackbar('Sorry', "Your session has expired",
            backgroundColor: ColorStyle.blackColor, colorText: ColorStyle.whiteColor);
        // throw Exception("Token has expired or is invalid. User needs to log in.");
      }
      //check to see if it is successful
      if (response.statusCode == 200) {
        print(response.body);
        //get the data from the server
        String jsonString = response.body;
        //convert the data to readable item. in this case List<map>
        items = decodeType(jsonString);
        return items;
      } else {
        var errorMessage = jsonDecode(response.body);
        if (response.statusCode != 401) {
          Get.snackbar('Sorry', errorMessage,
              backgroundColor: ColorStyle.blackColor, colorText: ColorStyle.whiteColor);
        }
        throw errorMessage["message"];
      }
    } catch (e) {
      print('this is the error $e');
      rethrow;
    }
  }

//GET METHOD FOR SINGLE ITEM
  Future<dynamic> getItem(route, decodeType) async {
    await getTokenDetails();
    try {
      var url = Uri.parse(route);
      var item;
      var _headers = {
        'Authorization': '$token',
        'content-type': 'application/json',
      };
      //now performing actual function of get item
      var response = await client.get(url, headers: _headers);
      //check to see if it is successful
      if (response.statusCode == 200) {
        //get the data from the server
        String jsonString = response.body;
        print('hello ${response.body}');
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
  Future<dynamic> postItem(route, data, decodeType) async {
    await getTokenDetails();
    try {
      var item;
      var url = Uri.parse(route);
      //you always need to convert the payload that the post is sending to json
      var _payload = json.encode(data);

      //and if the endpoint has headers and authorization requirement
      var _headers = {
        'content-type': 'application/json',
        'Authorization': '$token',
      };
      //now performing actual function of post item
      var response = await client.post(url, body: _payload, headers: _headers);
      print(response.body);
      //check to see if it is successful
      if (response.statusCode == 201) {
        print('hi ${response.body}');
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

  //POST METHOD FOR UPLOADING FILE
  Future<dynamic> getFileUploadUrlPostMethod(route, decodeType) async {
    await getTokenDetails();
    try {
      var item;
      var url = Uri.parse(route);

      //and if the endpoint has headers and authorization requirement
      var _headers = {
        'content-type': 'application/json',
        'Authorization': '$token',
      };
      //now performing actual function of post item
      var response = await client.post(url, headers: _headers);
      //check to see if it is successful
      if (response.statusCode == 201) {
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

  //PUT METHOD FOR UPDATING AN ITEM
  Future<dynamic> updateItem(route, data, decodeType) async {
    await getTokenDetails();
    try {
      var item;
      var url = Uri.parse(route);
      //you always need to convert the payload that the post is sending to json
      var _payload = json.encode(data);

      //and if the endpoint has headers and authorization requirement
      var _headers = {
        'Authorization': '$token',
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

  //PUT METHOD FOR UPLOADING FILE
  Future<dynamic> uploadFilePutMethod(route, data) async {
    try {
      var url = Uri.parse(route);
      var response = await client.put(
        url,
        body: data,
      );
      //check to see if it is successful
      if (response.statusCode == 200) {
        return print('successful');
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
    await getTokenDetails();
    try {
      var item;
      var url = Uri.parse(route);
      //you always need to convert the payload that the post is sending to json
      var _payload = json.encode(data);

      //and if the endpoint has headers and authorization requirement
      var _headers = {
        'Authorization': '$token',
        'content-type': 'application/json',
      };
      //now performing actual function of get item
      var response = await client.delete(url, headers: _headers);
      print(response.body);
      //check to see if it is successful
      if (response.statusCode == 200) {
        //get the data from the server
        String jsonString = response.body;
        //convert the data to readable item.
        item = decodeType(jsonString);
        Get.snackbar('Success', data['message'],
            backgroundColor: ColorStyle.blackColor, colorText: ColorStyle.whiteColor);
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
}
