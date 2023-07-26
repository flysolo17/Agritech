import 'package:agritech/constants/widgets/input_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/widgets/button.dart';
import '../../../constants/widgets/input_field.dart';
import '../../../styles/color_styles.dart';
import '../../../styles/text_styles.dart';

import 'loginPage.dart';

class VerificationConfirmationPage extends StatefulWidget {
  @override
  State<VerificationConfirmationPage> createState() => _VerificationConfirmationPageState();
}

class _VerificationConfirmationPageState extends State<VerificationConfirmationPage> {
  //initializing GetX controllers
  // OTPController otpController = Get.put(OTPController());
  //
  // var resendOTP = Get.find<ResendOTPController>();

  // initializing text controllers
  TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
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
                    height: MediaQuery.of(context).size.height * 0.65,
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
                              "Congratulations! Your Agritech account has been created. You may login and chech out the app’s features.",
                              style: MyTextStyles.text.copyWith(color: Colors.black54),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Note: Full features will require more details and validation.",
                              style: MyTextStyles.text.copyWith(color: Colors.black54),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 20),
                            Button(
                              onTap: () {
                                Get.to(() => LoginPage());
                              },
                              buttonWidth: double.infinity,
                              buttonText: "Login to your Account",
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
