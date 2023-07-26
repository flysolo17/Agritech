import 'package:agritech/constants/widgets/bottom_navigation.dart';
import 'package:agritech/modules/Home/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/widgets/button.dart';
import '../../../styles/color_styles.dart';
import '../../../styles/text_styles.dart';

class ProfileInfoSuccessPage extends StatelessWidget {
  const ProfileInfoSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.background,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 33.0),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.30),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.38,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              "lib/assets/images/check.png",
                              height: 87,
                              width: 94,
                            ),
                            SizedBox(height: 27),
                            Text(
                              "Success!",
                              style: MyTextStyles.header,
                            ),
                            SizedBox(height: 21),
                            Text(
                              "Thank you for completing your registration to Agritech. ",
                              style: MyTextStyles.text.copyWith(color: Colors.black54),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Explore all features of the app now!",
                              style: MyTextStyles.text.copyWith(color: Colors.black54),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 20),
                            Button(
                              onTap: () {
                                Get.to(() => MyBottomNavigation());
                              },
                              buttonWidth: double.infinity,
                              buttonText: "Back to Home",
                              buttonColor: ColorStyle.brandRed,
                              borderColor: ColorStyle.blackColor,
                              textColor: ColorStyle.whiteColor,
                            ),
                            SizedBox(height: 21),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
