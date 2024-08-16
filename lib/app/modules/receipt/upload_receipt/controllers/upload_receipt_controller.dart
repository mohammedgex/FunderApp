import 'dart:io';
import 'package:flutter/material.dart';
import 'package:funder_app/app/data/apis_url.dart';
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

  // validation
  bool validateFields() {
    if (receiptImage == null) {
      Get.snackbar('Error', 'Please select a receipt image.');
      return false;
    }

    if (receiptNum_Controller.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter a reference number.');
      return false;
    }

    if (despositDate_Controller.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter a deposit date.');
      return false;
    }

    if (despositedAmount_Controller.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter the deposited amount.');
      return false;
    }

    return true;
  }

  void PickreceiptImageGalary() async {
    ImagePicker imagePicker = ImagePicker();
    final XFile? pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      receiptImage!.value = File(pickedImage.path);
      print(receiptImage!.value);
    }
  }

  void PickreceiptImageCamera() async {
    ImagePicker imagePicker = ImagePicker();
    final XFile? pickedImage =
        await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      receiptImage!.value = File(pickedImage.path);
      print(receiptImage!.value);
    }
  }

  // api connect
  Future<void> ApiReceipt({
    String? method,
    int? property_id,
    String? countShares,
  }) async {
    isLoading.value = true;
    print(
        "$method $property_id $countShares ${despositedAmount_Controller.text.toString()} ${despositDate_Controller.text.toString()} ${receiptNum_Controller.text.toString()}");
    if (receiptImage!.value.path.isNotEmpty) {
      try {
        // Create a multipart request
        var request = http.MultipartRequest('POST', Uri.parse(URL));

        // Add form fields
        request.fields['method'] = method ?? '';
        request.fields['receipt_number'] =
            receiptNum_Controller.text.toString();
        request.fields['deposit_date'] =
            despositDate_Controller.text.toString();
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
          print(await response.stream.bytesToString());
          Get.defaultDialog(
              middleText: "",
              title: "customer support will contact you shortly",
              titleStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w400));
        } else {
          // Unsuccessful response
          isLoading.value = false;
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
}
