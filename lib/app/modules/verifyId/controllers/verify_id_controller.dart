import 'dart:io';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funder_app/app/data/apis_url.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class VerifyIdController extends GetxController {
  RxBool isLoading = false.obs;
  final box = GetStorage();

  var selectedType = ''.obs;

  static const URL = ApiUrls.Identification_api;
  // OTP controllers
  TextEditingController? first_num;
  TextEditingController? second_num;
  TextEditingController? third_num;
  TextEditingController? fourth_num;

  // Images
  Rx<File>? frontSide = Rx<File>(File(""));
  Rx<File>? backSide = Rx<File>(File(""));

  // pick front side ID
  void PickfrontSide() async {
    ImagePicker imagePicker = ImagePicker();
    final XFile? pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      frontSide!.value = File(pickedImage.path);
      print(frontSide!.value);
    }
  }

  // pick back side ID
  void PickbackSide() async {
    ImagePicker imagePicker = ImagePicker();
    final XFile? pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      backSide!.value = File(pickedImage.path);
      print(backSide!.value);
    }
  }

  // upload passport to database
  Future<void> UPLOADID(BuildContext context) async {
    if (backSide!.value.path.isNotEmpty && backSide!.value.path.isNotEmpty) {
      try {
        isLoading.value = true;

        // Create a multipart request
        var request = http.MultipartRequest('POST', Uri.parse(URL));

        request.fields['email'] = "${box.read("registeredEmail")}";
        request.fields['type'] = selectedType.value;

        // Add image file
        request.files.add(await http.MultipartFile.fromPath(
            'front_side', frontSide!.value.path));
        request.files.add(await http.MultipartFile.fromPath(
            'back_side', backSide!.value.path));

        // Send request
        var response = await request.send();

        // Handle response
        if (response.statusCode == 200) {
          isLoading.value = false;
          // Successful response
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
                      text: "Congratulations !",
                      color: const Color.fromRGBO(236, 138, 35, 1),
                      size: 20,
                      weight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  CustomText(
                    text:
                        "Your account is ready to use you will be directed to the home page.",
                    size: 16,
                    cenetr: true,
                    weight: FontWeight.w400,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  GestureDetector(
                    onTap: () => Get.offAllNamed(Routes.LOGIN),
                    child: const Button(
                      width: 252,
                      text: "Continue",
                      buttonColor: Color.fromRGBO(236, 138, 35, 1),
                    ),
                  )
                ],
              ));

          print(await response.stream.bytesToString());
        } else {
          // Unsuccessful response
          print(await response.stream.bytesToString());
          isLoading.value = false;
          Get.snackbar("Failed", "Email or Password has been found",
              snackPosition: SnackPosition.BOTTOM);
        }
      } catch (error) {
        // Error occurred
        isLoading.value = false;
      }
    } else {
      AnimatedSnackBar.material(
        'An occur has happened.',
        duration: const Duration(seconds: 3),
        mobileSnackBarPosition: MobileSnackBarPosition.bottom,
        type: AnimatedSnackBarType.error,
      ).show(
        context!,
      );
    }
  }
}
