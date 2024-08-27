import 'dart:io';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funder_app/app/data/apis_url.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadReceiptController extends GetxController {
  Rx<File>? receiptImage = Rx<File>(File(""));

  RxBool isLoading = false.obs;
  final box = GetStorage();

  // TextField Controllers init

  late TextEditingController receiptNum_Controller;
  late TextEditingController despositDate_Controller;
  late TextEditingController despositedAmount_Controller;

  // URL
  final String URL = ApiUrls.Receipt_api;

  // on init
  @override
  void onInit() {
    receiptNum_Controller = TextEditingController();
    despositDate_Controller = TextEditingController();
    despositedAmount_Controller = TextEditingController();

    super.onInit();
  }

  void PickreceiptImageGalary() async {
    ImagePicker imagePicker = ImagePicker();
    final XFile? pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      receiptImage!.value = File(pickedImage.path);
    }
  }

  void PickreceiptImageCamera() async {
    ImagePicker imagePicker = ImagePicker();
    final XFile? pickedImage =
        await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      receiptImage!.value = File(pickedImage.path);
    }
  }

  // api connect
  Future<void> ApiReceipt(
      {String? method,
      int? property_id,
      String? countShares,
      BuildContext? context}) async {
    isLoading.value = true;
    if (receiptImage!.value.path.isNotEmpty) {
      try {
        // Create a multipart request
        var request = http.MultipartRequest('POST', Uri.parse(URL));

        // Add form fields
        request.fields['method'] = method ?? '';
        request.fields['receipt_number'] =
            receiptNum_Controller.text.toString();
        request.fields['deposit_date'] = despositDate_Controller.text
            .split('/')
            .reversed
            .join('/')
            .toString();
        request.fields['deposited_amount'] =
            despositedAmount_Controller.text.toString();
        request.fields['property_id'] = property_id.toString();
        request.fields['count_sheres'] = countShares ?? '';

        // bear token
        request.headers
            .addAll({"Authorization": "Bearer ${box.read("userToken")}"});

        // Add image file
        request.files.add(await http.MultipartFile.fromPath(
            'image', receiptImage!.value.path));

        // Send request
        var response = await request.send();

        // Handle response
        if (response.statusCode == 200) {
          // Successful response
          isLoading.value = false;
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
                      text: "Successfully !",
                      color: const Color.fromRGBO(236, 138, 35, 1),
                      size: 20,
                      weight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  CustomText(
                    text: "Customer support will contact you shortly.",
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
        } else {
          // Unsuccessful response
          isLoading.value = false;
          AnimatedSnackBar.material(
            'An error occurs.',
            duration: const Duration(seconds: 3),
            mobileSnackBarPosition: MobileSnackBarPosition.bottom,
            type: AnimatedSnackBarType.error,
          ).show(
            // ignore: use_build_context_synchronously
            context!,
          );
        }
      } catch (error) {
        // Error occurred
        isLoading.value = false;
        AnimatedSnackBar.material(
          'An occur has happened.',
          duration: const Duration(seconds: 3),
          mobileSnackBarPosition: MobileSnackBarPosition.bottom,
          type: AnimatedSnackBarType.error,
        ).show(
          context!,
        );
      }
    } else {
      isLoading.value = false;
      AnimatedSnackBar.material(
        'Please pick an image.',
        duration: const Duration(seconds: 3),
        mobileSnackBarPosition: MobileSnackBarPosition.bottom,
        type: AnimatedSnackBarType.warning,
      ).show(
        context!,
      );
    }
  }
}
