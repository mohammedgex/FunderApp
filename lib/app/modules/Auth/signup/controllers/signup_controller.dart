import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:funder_app/app/data/apis_url.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:http/http.dart' as http;
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignupController extends GetxController {
  RxBool isLoading = false.obs;

  // TextField Controllers init
  late TextEditingController Email_Controller;
  late TextEditingController Password_Controller;
  late TextEditingController RePassword_Controller;
  late TextEditingController Name_Controller;
  late TextEditingController Phone_Controller;

  // Profie Image Varable
  Rx<File>? profileImage = Rx<File>(File(""));

  @override
  void onInit() {
    Email_Controller = TextEditingController();
    Password_Controller = TextEditingController();
    Name_Controller = TextEditingController();
    Phone_Controller = TextEditingController();
    RePassword_Controller = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    Email_Controller.dispose();
    Password_Controller.dispose();
    Name_Controller.dispose();
    Phone_Controller.dispose();
    RePassword_Controller.dispose();
    super.onClose();
  }

  // check box
  RxBool Isckeck = false.obs;

  // api urls
  final String URL = ApiUrls.Register_api;
  final String OTP_SEND = ApiUrls.OTP_api;

  // SIGNUP API
  Future<void> ApiRegister({
    String? Email,
    String? Password,
    String? Name,
    String? phone,
  }) async {
    if (Isckeck.value && !profileImage!.value.path.isEmpty) {
      try {
        isLoading.value = true;

        // Create a multipart request
        var request = http.MultipartRequest('POST', Uri.parse(URL));

        // Add form fields
        request.fields['name'] = Name ?? '';
        request.fields['phone'] = phone ?? '';
        request.fields['email'] = Email ?? '';
        request.fields['password'] = Password ?? '';

        // Add image file

        request.files.add(await http.MultipartFile.fromPath(
            'image', profileImage!.value.path));

        // Send request
        var response = await request.send();

        // Handle response
        if (response.statusCode == 200) {
          // Successful response
          await SendOtp(Email!);
          Get.toNamed(Routes.CREATOTP, arguments: ["$Email"]);
          isLoading.value = false;
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
        print("error : $error");
      }
    } else {
      print("image not picked up or you didn't check");
    }
  }

  // change check value according to user action
  void checkBox(value) {
    Isckeck.value = value;
    print(value);
  }

  // OTP SEND API
  Future<void> SendOtp(String Email) async {
    try {
      final response = await http.post(
        Uri.parse(OTP_SEND),
        body: jsonEncode({
          'email': Email,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        print("Sent OTP");

        print(response.body);
      } else {
        Get.defaultDialog(
            title: "Error",
            content: CustomText(
              text: "Failed to send OTP",
            ));
      }
    } catch (error) {
      isLoading.value = false;
      print("OTP ERROR : $error");
    }
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
}
