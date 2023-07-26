import 'package:agritech/constants/widgets/input_fields.dart';
import 'package:agritech/modules/Home/view/terms_and_condition.dart';
import 'package:agritech/modules/authentication/view/verification_confirmation_page.dart';
import 'package:agritech/modules/authentication/view/verify_account_otp_page.dart';
import 'package:email_otp/email_otp.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../constants/widgets/button.dart';
import '../../../constants/widgets/input_field.dart';
import '../../../styles/color_styles.dart';
import '../../../styles/text_styles.dart';

import 'loginPage.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // SignUpController signUpController = Get.put(SignUpController());

  bool passwordIsHidden = true;

  hideThePassword() {
    setState(() {
      passwordIsHidden = !passwordIsHidden;
    });
  }

  bool _isChecked1 = false;
  bool _isChecked2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.background,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33.0),
            child: Column(
              children: [
                SizedBox(height: 80),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        height: 33,
                        width: 33,
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: ColorStyle.blackColor,
                            )),
                        child: SvgPicture.asset(
                            "lib/assets/svg_icons/Light/Arrow - Left.svg")),
                  ),
                ),
                SizedBox(height: 40),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "REGISTER",
                          style: MyTextStyles.header,
                        ),
                        Text(
                          "Create your Agritech account",
                          style: MyTextStyles.headerlight.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 62),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          "*",
                          style: MyTextStyles.text.copyWith(
                            fontSize: 16,
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          "Required",
                          style: MyTextStyles.text,
                        ),
                      ],
                    )),
                SizedBox(height: 5),
                InputField(
                  hasTitle: false,
                  hintText: "Firstname",
                ),
                InputField(
                  hasTitle: false,
                  hintText: "Lastname",
                ),
                InputField(
                  isEmail: true,
                  hasTitle: false,
                  hintText: "Email",
                  controller: _emailController,
                ),
                InputField(
                  hasTitle: false,
                  hintText: "Province",
                ),
                InputField(
                  hasTitle: false,
                  hintText: "Username",
                ),
                InputField(
                  controller: _passwordController,
                  hasSuffix: true,
                  isObsured: passwordIsHidden,
                  suffixIcon: GestureDetector(
                    onTap: hideThePassword,
                    child: passwordIsHidden
                        ? const Icon(
                            Icons.visibility,
                            color: ColorStyle.blackColor,
                          )
                        : const Icon(
                            Icons.visibility_off,
                            color: ColorStyle.blackColor,
                          ),
                  ),
                  hasTitle: false,
                  hintText: "Password",
                ),
                InputField(
                  controller: _confirmPasswordController,
                  hasSuffix: true,
                  isObsured: passwordIsHidden,
                  suffixIcon: GestureDetector(
                    onTap: hideThePassword,
                    child: passwordIsHidden
                        ? const Icon(
                            Icons.visibility,
                            color: ColorStyle.blackColor,
                          )
                        : const Icon(
                            Icons.visibility_off,
                            color: ColorStyle.blackColor,
                          ),
                  ),
                  hasTitle: false,
                  hintText: "Confirm Password",
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    SizedBox(
                      height: 60,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Checkbox(
                          value: _isChecked1,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked1 = value ?? false;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const TermsAndCondition());
                            },
                            child: Text(
                              "I hereby agree to the Program Mechanics and Terms",
                              style: MyTextStyles.text,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 105,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Checkbox(
                          value: _isChecked1,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked1 = value ?? false;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        "I hereby agree that all information I provided here can be processed and used by Agritech in accourdance with their Privacy Policy",
                        style: MyTextStyles.text,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Button(
                  onTap: () async {
                    OtpVerification.setField(_emailController.text,
                        _firstNameController.text, _passwordController.text);
                    OtpVerification.sendOtp();
                  },
                  buttonWidth: double.infinity,
                  buttonText: "Next",
                  buttonColor: ColorStyle.brandRed,
                  borderColor: ColorStyle.blackColor,
                  textColor: ColorStyle.whiteColor,
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OtpVerification {
  static const String sessionName = "gmail verification";

  static late String email;
  static late String userName;
  static late String password;
  static EmailOTP myauth = EmailOTP();

  static void setField(String mail, String uName, String pass) {
    email = mail;
    userName = uName;
    password = pass;
  }

  static void sendOtp() async {
    myauth.setConfig(
        appEmail: "shakyatilak45@gmail.com",
        appName: "Email OTP",
        userEmail: email,
        otpLength: 6,
        otpType: OTPType.digitsOnly);

    var res = await myauth.sendOTP();
    if (res) {
      print("otp sended on $email");
      Get.to(() => VerifyAccountOtpPage());
    }
  }

  static verifyOtp(String otp, BuildContext context) async {
    var res = await myauth.verifyOTP(otp: otp);
    if (res) {
      print("otp validate");
      AuthServices.signupUser(email, password, userName, context);
      Get.to(() => VerificationConfirmationPage());
    } else {
      print("Otp invalid");
    }
  }
}
