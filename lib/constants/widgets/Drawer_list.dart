import 'dart:io';
import 'package:agritech/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../modules/Authentication/view/loginPage.dart';

import '../../modules/Profile/view/profile_page.dart';

import '../../styles/color_styles.dart';
import 'Menus.dart';

class DrawerList extends StatefulWidget {
  @override
  State<DrawerList> createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  //var userDetails = Get.put(HomePageController());
  //
  // var userDetail = Get.find<UserDetails>();

  @override
  void initState() {
    //userDetail.getUserDetailsController();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325,
      child: Drawer(
        backgroundColor: ColorStyle.whiteColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                //profile picture and info
                DrawerHeader(
                  child: Center(
                    child: Center(
                      child: Row(
                        children: [
                          ClipRRect(
                              // borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                            "lib/assets/images/logo.png",
                            fit: BoxFit.contain,
                            height: 60,
                            width: 60,
                          )),
                          SizedBox(width: 10),
                          Text(
                            "S&P",
                            style: MyTextStyles.header.copyWith(
                              color: ColorStyle.brandGreen,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Menu(
                      title: 'Dashboard',
                      icon: 'Home.svg',
                      // page: HomePage(),
                    ),
                    Menu(
                      title: 'Inventory',
                      icon: 'Activity.svg',
                      // page: AllPostsPage(
                      //   active: "All",
                      // ),
                    ),
                    Menu(
                      title: 'Reports',
                      icon: 'Discount.svg',
                      // page: PricingPage(),
                    ),
                    Menu(
                      title: 'Customer Logs',
                      icon: 'Notification.svg',
                      // page: NotificationPage(),
                    ),
                    Menu(
                      title: 'Orders',
                      icon: 'Wallet.svg',
                      // page: WalletPage(),
                    ),
                    Menu(
                      title: 'Manage Store',
                      icon: 'Profile.svg',
                      page: ProfilePage(),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Menu(
                  isLogout: true,
                  title: 'Settings',
                  icon: 'Setting.svg',
                  // page: LoginPage(),
                ),
                Menu(
                  isLogout: true,
                  title: 'Logout',
                  icon: 'Logout.svg',
                  page: LoginPage(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
