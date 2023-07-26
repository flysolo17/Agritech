import 'package:agritech/styles/color_styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'modules/authentication/view/web_login.dart';
import 'modules/welcome/splash_screen_view.dart';
import 'package:flutter/foundation.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: kIsWeb ? WebLogin() : SplashScreenPage(),
      builder: (context, child) => ResponsiveWrapper.builder(child,
          maxWidth: double.infinity,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(
            color: ColorStyle.blackColor,
          )),
    );
  }
}
