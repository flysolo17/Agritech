import 'package:agritech/constants/widgets/custom_input_container.dart';
import 'package:agritech/modules/profile/view/profile_info_success_page.dart';
import 'package:agritech/styles/text_styles.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import '../../../constants/widgets/button.dart';
import '../../../constants/widgets/input_field.dart';
import '../../../styles/color_styles.dart';
import 'package:path/path.dart';

class ProfileInfoPage extends StatefulWidget {
  ProfileInfoPage({Key? key}) : super(key: key);

  @override
  State<ProfileInfoPage> createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {
  var startDate;
  PlatformFile? pickedBannerImage;
  var eventBannerUrl = '';
  bool uploadedImage = false;

  Future selectBanner() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result == null) return;

    setState(() {
      pickedBannerImage = result.files.first;
      uploadedImage = true;
    });

    // //this uploads the image to backblaze
    // await uploads.fileUploadController(pickedBannerImage);
    // print(uploads.url);

    return pickedBannerImage;
  }

  var startDateTitle = 'Date of Birth';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Additional Information",
                      style: MyTextStyles.header,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "We want to know you better. Please enter thes additional information so that we can have you fully verified!",
                      style: MyTextStyles.text,
                    ),
                  ],
                ),
                SizedBox(height: 30),
                InputField(
                  hasTitle: false,
                  hintText: "Birthday",
                ),
                SizedBox(height: 5),
                InputField(
                  hasTitle: false,
                  hintText: "City / Town",
                ),
                InputField(
                  hasTitle: false,
                  hintText: "Barangay",
                ),
                InputField(
                  hasTitle: false,
                  hintText: "Farm Address (Optional)",
                ),
                SizedBox(height: 5),
                CustomInputContainer(
                    hasTitle: false,
                    radius: 5.0,
                    titleColor: ColorStyle.blackColor,
                    title: 'List Start Date',
                    uploaded: true,
                    containerHeight: 65.0,
                    onTap: () {
                      selectBanner();
                      setState(() {});
                    },
                    customWidget: uploadedImage
                        ? Text(
                            basename(pickedBannerImage!.path.toString()),
                            style: MyTextStyles.inputField.copyWith(
                              color: ColorStyle.blackColor,
                            ),
                          )
                        : Text(
                            "Upload Valid ID (Optional)",
                            style: MyTextStyles.inputField.copyWith(
                              color: ColorStyle.blackColor,
                            ),
                          )),
                SizedBox(height: 20),
                Text(
                  "Photo of any of the following Philippine valid ID’s Passport, Driver’s license, SSS UMID Card.",
                  style: MyTextStyles.text,
                ),
                Text(
                  "PhilHealth ID, TIN Card, Postal ID, Voter’s ID, PRc ID, and OFW ID.",
                  style: MyTextStyles.text,
                ),
                SizedBox(height: 40),
                Button(
                  onTap: () {
                    Get.to(() => ProfileInfoSuccessPage());
                  },
                  buttonWidth: double.infinity,
                  buttonText: "Next",
                  buttonColor: ColorStyle.brandRed,
                  borderColor: ColorStyle.blackColor,
                  textColor: ColorStyle.whiteColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
