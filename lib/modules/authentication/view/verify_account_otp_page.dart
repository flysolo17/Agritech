import 'package:agritech/constants/widgets/input_fields.dart';
import 'package:agritech/modules/authentication/view/signup_page.dart';
import 'package:agritech/modules/authentication/view/verification_confirmation_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/widgets/button.dart';
import '../../../constants/widgets/input_field.dart';
import '../../../styles/color_styles.dart';
import '../../../styles/text_styles.dart';

import 'loginPage.dart';

class VerifyAccountOtpPage extends StatefulWidget {
  @override
  State<VerifyAccountOtpPage> createState() => _VerifyAccountOtpPageState();
}

class _VerifyAccountOtpPageState extends State<VerifyAccountOtpPage> {
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "lib/assets/images/authPageImage.png",
                  height: 87,
                  width: 94,
                ),
                SizedBox(height: 27),
                Text(
                  "Verify Gmail Account",
                  style: MyTextStyles.header,
                ),
                SizedBox(height: 21),
                Text(
                  "Enter the verification code we just sent you on your provided gmail account",
                  style: MyTextStyles.text.copyWith(color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 21),
                InputField(
                  controller: _otpController,
                  hasTitle: false,
                  hintText: "Email Verification",
                ),
                SizedBox(height: 40),
                Button(
                  onTap: () async {
                    await OtpVerification.verifyOtp(
                        _otpController.text, context);
                  },
                  buttonWidth: double.infinity,
                  buttonText: "Submit",
                  buttonColor: ColorStyle.brandRed,
                  borderColor: ColorStyle.blackColor,
                  textColor: ColorStyle.whiteColor,
                ),
                SizedBox(height: 21),
                Text(
                  "Resend Code? Click Here after 60 seconds",
                  style: MyTextStyles.text,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
