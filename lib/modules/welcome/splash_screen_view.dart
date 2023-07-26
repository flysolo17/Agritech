import 'dart:async';

import 'package:agritech/modules/Home/view/homepage.dart';
import 'package:agritech/modules/authentication/view/loginPage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../../styles/color_styles.dart';
import '../../styles/text_styles.dart';

class SplashScreenPage extends StatefulWidget {
  SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  // checkInternetConnection() async {
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.mobile) {
  //     // I am connected to a mobile network.
  //     print('you are using mobile');
  //   } else if (connectivityResult == ConnectivityResult.wifi) {
  //     print('you are using wifi');
  //     // I am connected to a wifi network.
  //   } else if (connectivityResult == ConnectivityResult.none) {
  //     print('you are NOT connected');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text('You are offline!'),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //     Get.to(() => InternetErrorPage());
  //   }
  // }

  late final prefs;
  late bool firstCall;
  late bool checkUserLoginStatus;
  // final userDetails = Get.put(UserDetails());
  // var eventList = Get.put(EventListManager());
  //final checkInternet = Get.put(CheckInternetConnectivityManager());
  var eventId;
  Future<void> firstCallCheck() async {
    firstCall = await IsFirstRun.isFirstCall();
  }

  Future<void> checkLogin() async {
    // await checkInternetConnection();
    prefs = await SharedPreferences.getInstance();
    checkUserLoginStatus = prefs.getBool('logged In') ?? false;
    // if (checkUserLoginStatus) await userDetails.getUserDetailsController();
    // if (checkUserLoginStatus) await eventList.getEventListController();
    // if (checkUserLoginStatus && eventList.dataFromModel.value.events!.isNotEmpty) {
    //   eventId = eventList.dataFromModel.value.events![0].id.toString();
    // }

    Timer(const Duration(seconds: 3), () {
      Get.off(
        () => LoginPage(),
        // checkUserLoginStatus
        //     // ? OnboardingScreen()
        //     // : checkUserLoginStatus
        //     ? HomePage()
        //     : LoginPage(),
        // arguments: eventId,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    firstCallCheck();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorStyle.background,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: height * 0.45),
            SizedBox(
              height: height * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'lib/assets/images/logo.png',
                    // height: 145.0,
                    width: 200.0,
                  ),
                  Center(
                    child: Text(
                      "UniTech",
                      style: MyTextStyles.header.copyWith(
                        color: ColorStyle.brandRed,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
