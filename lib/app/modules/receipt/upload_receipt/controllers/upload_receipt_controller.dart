import 'dart:convert';
import 'dart:io';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:funder_app/app/data/apis_url.dart';
import 'package:funder_app/app/data/consts.dart';
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
            // .split('/')
            // .reversed
            // .join('/')
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

        var responseBody = await response.stream.bytesToString();

        // Handle response
        if (response.statusCode == 200) {
          // Successful response
          isLoading.value = false;
          Kconstans.showDialog(context!,
              title: "Successfully",
              content: "Customer support will contact you shortly",
              show: false,
              routeName: Routes.MAIN_PAGE);
        } else {
          // Unsuccessful response
          isLoading.value = false;
          Kconstans.showDialog(context!,
              title: "Faild",
              content: jsonDecode(responseBody)["error"],
              show: false,
              routeName: Routes.MAIN_PAGE);
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
