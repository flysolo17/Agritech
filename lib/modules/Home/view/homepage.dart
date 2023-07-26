import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/widgets/bottom_navigation.dart';
import '../../../styles/color_styles.dart';
import '../../../styles/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imageUrls = [
    'lib/assets/images/homeimg1.png',
    'lib/assets/images/homeimg1.png',
    'lib/assets/images/homeimg3.png',
    // Add more image URLs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: ColorStyle.brandRed,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Icon(
            Icons.menu,
            size: 35,
          ),
        ),
        actions: [
          SvgPicture.asset(
            "lib/assets/svg_icons/Light/Buy.svg",
            height: 35,
            color: Colors.white,
          ),
          SizedBox(width: 15),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    "Explore Products",
                    style: MyTextStyles.header,
                  ),
                  SizedBox(height: 15),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      'lib/assets/images/offer1.png',
                      height: 180,
                      width: double.infinity,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                color: const Color(0XFFe5b2b2),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: const Icon(
                                Icons.favorite,
                                color: ColorStyle.brandRed,
                              ),
                            ),
                            Text(
                              "MY FAVORITES",
                              style: MyTextStyles.size10,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                color: const Color(0XFFC7DBC7),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: Icon(
                                Icons.shopping_bag,
                                color: Colors.green.shade600,
                                size: 35,
                              ),
                            ),
                            Text(
                              "INBOX",
                              style: MyTextStyles.size10,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                color: Colors.yellow.shade200,
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: Icon(
                                Icons.wallet,
                                color: Colors.yellow.shade800,
                                size: 35,
                              ),
                            ),
                            Text(
                              "MY ORDERS",
                              style: MyTextStyles.size10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    "Featured Products",
                    style: MyTextStyles.header,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 200, // Set the height of the carousel
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: imageUrls.length,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.asset(
                            imageUrls[index],
                            fit: BoxFit
                                .cover, // Adjust the image size to cover the entire container
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
