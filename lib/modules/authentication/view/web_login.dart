import 'package:agritech/styles/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/widgets/button.dart';
import '../../../constants/widgets/input_field.dart';
import '../../../styles/text_styles.dart';
import '../../Home/view/admin_dashboard.dart';

class WebLogin extends StatefulWidget {
  WebLogin({Key? key}) : super(key: key);

  @override
  State<WebLogin> createState() => _WebLoginState();
}

class _WebLoginState extends State<WebLogin> {
  bool passwordIsHidden = true;

  hideThePassword() {
    setState(() {
      passwordIsHidden = !passwordIsHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.whiteColor,
      body: Row(
        children: [
          Expanded(
              child: Image.asset(
            "lib/assets/images/LoginImage.png",
            fit: BoxFit.cover,
          )),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.symmetric(
                horizontal: 100,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "lib/assets/images/logo.png",
                    height: 137,
                  ),
                  const SizedBox(
                    height: 82,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      child: Text(
                        "Login with your Agritech Account",
                        style: MyTextStyles.headerlight,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  InputField(
                    hasTitle: false,
                    hintText: "Username",
                  ),
                  InputField(
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
                  SizedBox(height: 40),
                  Button(
                    onTap: () {
                      Get.to(() => AdminDashboardPage());
                    },
                    buttonWidth: double.infinity,
                    buttonText: "Login",
                    buttonColor: ColorStyle.brandRed,
                    borderColor: ColorStyle.blackColor,
                    textColor: ColorStyle.whiteColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
