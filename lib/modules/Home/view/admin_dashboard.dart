import 'package:agritech/constants/widgets/Drawer_list.dart';
import 'package:agritech/styles/color_styles.dart';
import 'package:flutter/material.dart';

import '../../../constants/widgets/input_field.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.whiteColor,
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: DrawerList(),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  color: Color(
                0xffF0F1F3,
              )),
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                    height: 100,
                    child: Row(
                      children: [
                        InputField(
                          containerColor: Colors.grey,
                          hasTitle: false,
                          hasPreffix: true,
                          hintText: "Search inventory, reports, order",
                        ),
                      ],
                    ),
                  ),
                  Container(height: 76),
                  Expanded(
                    child: Container(),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
