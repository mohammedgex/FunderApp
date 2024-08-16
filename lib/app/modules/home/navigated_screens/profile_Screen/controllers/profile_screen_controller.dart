import 'dart:io';
import 'package:flutter_svg/svg.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:funder_app/app/data/apis_url.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreenController extends GetxController {
  // picked up image
  Rx<File>? profileImage = Rx<File>(File(""));
  // loading Val
  RxBool isLoading = false.obs;
  // init local storage
  final box = GetStorage();
  // TextField Controllers init
  late TextEditingController UserName_Controller;
  late TextEditingController PhoneNumber_Controller;
  // api url
  final String URL = ApiUrls.Profile_api;

  // when page started
  @override
  void onInit() {
    UserName_Controller = TextEditingController();
    PhoneNumber_Controller = TextEditingController();
    UserName_Controller.text = box.read("userName");
    PhoneNumber_Controller.text = box.read("userPhone");
    super.onInit();
  }

  // show password
  RxBool showPassword = false.obs;

  // trogle password
  void troglePassword() {
    showPassword.value = !showPassword.value;
  }

  // clear token when sign out
  void clearToken() {
    box.write("userToken", "SignedOut");
  }

  // Pick profileImage
  void PickprofileImage() async {
    ImagePicker imagePicker = ImagePicker();
    final XFile? pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      profileImage!.value = File(pickedImage.path);
      print(profileImage!.value);
    }
  }

  // api change personal details
  Future<void> ApiEdit({
    String? UserName,
    String? phone,
  }) async {
    try {
      isLoading.value = true;

      // Create a multipart request
      var request = http.MultipartRequest('POST', Uri.parse(URL));
      request.headers
          .addAll({"Authorization": "Bearer ${box.read("userToken")}"});

      // Add form fields
      request.fields['name'] = UserName ?? '';
      request.fields['phone'] = phone ?? '';

      // Add image file

      if (profileImage!.value.path.isNotEmpty) {
        request.files.add(await http.MultipartFile.fromPath(
            'image', profileImage!.value.path));
      }

      // Send request
      var response = await request.send();

      // Handle response
      if (response.statusCode == 200) {
        // Successful response

        isLoading.value = false;
        // dialog

        Get.defaultDialog(
            barrierDismissible: false,
            onWillPop: () async => await Get.offAllNamed(Routes.MAIN_PAGE),
            title: "",
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/succ_verify.svg"),
                const SizedBox(
                  height: 35,
                ),
                Center(
                  child: CustomText(
                    text: "Done ",
                    color: const Color.fromRGBO(236, 138, 35, 1),
                    size: 20,
                    weight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                CustomText(
                  text: "Data has been edited successfully.",
                  size: 16,
                  cenetr: true,
                  weight: FontWeight.w400,
                ),
                const SizedBox(
                  height: 35,
                ),
                GestureDetector(
                  onTap: () => Get.offAllNamed(Routes.MAIN_PAGE),
                  child: const Button(
                    width: 252,
                    text: "Continue",
                    buttonColor: Color.fromRGBO(236, 138, 35, 1),
                  ),
                )
              ],
            ));

        //end alert
        print(await response.stream.bytesToString());
      } else {
        // Unsuccessful response
        print(await response.stream.bytesToString());
        isLoading.value = false;
        Get.snackbar("Failed", "Unsuccessful",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (error) {
      // Error occurred
      isLoading.value = false;
      print("error : $error");
    }
  }
}
