import 'package:agritech/modules/authentication/view/signup_page.dart';
import 'package:agritech/modules/profile/view/profile_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/api_management/api_management/http_helper.dart';
import '../../../constants/widgets/button.dart';
import '../../../constants/widgets/input_field.dart';
import '../../../constants/widgets/input_fields.dart';
import '../../../styles/color_styles.dart';
import '../../../styles/text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordIsHidden = true;

  hideThePassword() {
    setState(() {
      passwordIsHidden = !passwordIsHidden;
    });
  }

  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();
  late final prefs;
  var removeLoginPreference;
  var removeUserToken;
  var mydeviceToken;
  // var login = Get.put(LoginManager());
  // Future<void> setLogin() async {
  //   prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool('logged In', false);
  // }

  Future<void> removeLocalStorage() async {
    prefs = await SharedPreferences.getInstance();
    removeUserToken = await prefs.remove('userToken');
    removeLoginPreference = await prefs.remove('logged In');
    await prefs.remove("eventId");
  }

  Future<void> saveDeviceToken(token) async {
    await prefs.setString('deviceToken', token);
  }

  @override
  void initState() {
    // TODO: implement initState
    // removeLocalStorage();
    // EraseEverything().deleteAppDir();
    // EraseEverything().deleteCacheDir();

    // FirebaseMessaging _firebaseMessaging =
    //     FirebaseMessaging.instance; // Change here
    // _firebaseMessaging.getToken().then((token) {
    //   mydeviceToken = token;
    //   saveDeviceToken(token);
    // });
    super.initState();
  }

  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.background,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 200,
                    child: Text(
                      "Login with your Agritech Account",
                      style: MyTextStyles.header,
                    ),
                  ),
                ),
                SizedBox(height: 25),
                InputField(
                  hasTitle: false,
                  hintText: "Username",
                  controller: _emailController,
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
                SizedBox(height: 40),
                Button(
                  onTap: () async {
                    AuthServices.signinUser(_emailController.text,
                        _passwordController.text, context);
                  },
                  buttonWidth: double.infinity,
                  buttonText: "Login",
                  buttonColor: ColorStyle.brandRed,
                  borderColor: ColorStyle.blackColor,
                  textColor: ColorStyle.whiteColor,
                ),
                SizedBox(height: 40),
                Text(
                  "Forgot Password/ Username/ OTP Actvation",
                  style: MyTextStyles.textBold.copyWith(
                    color: ColorStyle.blackColor,
                  ),
                ),
                SizedBox(height: 51),
                Text(
                  "Don’t have an account?",
                  style: MyTextStyles.text,
                ),
                SizedBox(height: 40),
                Button(
                  onTap: () {
                    Get.to(() => SignUpPage());
                  },
                  buttonWidth: double.infinity,
                  buttonText: "Register here",
                  buttonColor: Colors.transparent,
                  borderColor: ColorStyle.blackColor,
                  textColor: ColorStyle.blackColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AuthServices {
  static signupUser(
      String email, String password, String name, BuildContext context) async {
    print("login with $email : $password");
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      await FirebaseAuth.instance.currentUser!.updateEmail(email);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Registration Successful')));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Password Provided is too weak')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Email Provided already Exists')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  static signinUser(String email, String password, BuildContext context) async {
    print("login with $email : $password");
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print("login");
      Get.to(() => ProfileInfoPage());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Login Success')));
    } on FirebaseAuthException catch (e) {
      print("login not ${e.message}");
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('No user Found with this Email')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Password did not match')));
      }
    }
  }
}
