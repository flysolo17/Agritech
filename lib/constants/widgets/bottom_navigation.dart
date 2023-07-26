import 'package:agritech/modules/buy/view/buy_page.dart';
import 'package:agritech/modules/pest_map/view/pest_map_page.dart';
import 'package:agritech/modules/s&P/view/sandp_guide_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../modules/Home/view/homepage.dart';
import '../../modules/profile/view/profile_page.dart';
import '../../styles/color_styles.dart';
import '../../styles/text_styles.dart';

class MyBottomNavigation extends StatefulWidget {
  var page;
  bool isNavigation;

  MyBottomNavigation({this.page, this.isNavigation = false});
  @override
  State<MyBottomNavigation> createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  int _currentIndex = 0;

  void _navigateBottomBar(int index) {
    print(widget.page);
    setState(() {
      _currentIndex = index;
    });
    print(widget.page);
  }

  List myPages = [
    HomePage(),
    PestMapPage(),
    BuyPage(),
    SAndPPage(), //MyBookingPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myPages[_currentIndex],
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        color: ColorStyle.whiteColor,
        padding: EdgeInsets.only(top: 10),
        child: BottomNavigationBar(
          selectedFontSize: 30,
          unselectedLabelStyle: MyTextStyles.text,
          selectedItemColor: ColorStyle.brandGreen,
          unselectedItemColor: ColorStyle.grey,
          showSelectedLabels: true,
          selectedLabelStyle:
              MyTextStyles.text.copyWith(fontWeight: FontWeight.w700),
          backgroundColor: ColorStyle.whiteColor,
          currentIndex: _currentIndex,
          onTap: (value) {
            _navigateBottomBar(value);
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  _currentIndex == 0
                      ? 'lib/assets/svg_icons/Bold/Home.svg'
                      : 'lib/assets/svg_icons/Light/Home.svg',
                  color: _currentIndex == 0
                      ? ColorStyle.brandGreen
                      : ColorStyle.grey,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  _currentIndex == 1
                      ? Icons.bug_report
                      : Icons.bug_report_outlined,
                  size: 30,
                ),
                label: 'Pest Map'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  _currentIndex == 2
                      ? 'lib/assets/svg_icons/Bold/Bag.svg'
                      : 'lib/assets/svg_icons/Light/Bag.svg',
                  color: _currentIndex == 2
                      ? ColorStyle.brandGreen
                      : ColorStyle.brandGreen,
                ),
                label: 'Buy'),
            BottomNavigationBarItem(
                icon: Icon(
                  _currentIndex == 3
                      ? Icons.energy_savings_leaf
                      : Icons.energy_savings_leaf_outlined,
                  size: 30,
                ),
                label: 'Agri Bot'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  _currentIndex == 4
                      ? 'lib/assets/svg_icons/Bold/Profile.svg'
                      : 'lib/assets/svg_icons/Light/Profile.svg',
                  color: _currentIndex == 4
                      ? ColorStyle.brandGreen
                      : ColorStyle.grey,
                ),
                label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
