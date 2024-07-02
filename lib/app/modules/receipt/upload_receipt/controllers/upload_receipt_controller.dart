import 'dart:io';
import 'package:flutter/material.dart';
import 'package:funder_app/app/data/apis_url.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadReceiptController extends GetxController {
  //TODO: Implement UploadReceiptController
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

  void PickreceiptImage() async {
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
    String? receipt_num,
    String? desposit_date,
    String? desposited_amount,
    String? property_id,
    String? countShares,
  }) async {
    if (!receiptImage!.value.path.isEmpty) {
      try {
        isLoading.value = true;

        // Create a multipart request
        var request = http.MultipartRequest('POST', Uri.parse(URL));

        // Add form fields
        request.fields['method'] = method ?? '';
        request.fields['receipt_number'] = receipt_num ?? '';
        request.fields['deposit_date'] = desposit_date ?? '';
        request.fields['deposited_amount'] = desposited_amount ?? '';
        request.fields['property_id'] = property_id ?? '';
        request.fields['count_sheres'] = countShares ?? '';

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
}
