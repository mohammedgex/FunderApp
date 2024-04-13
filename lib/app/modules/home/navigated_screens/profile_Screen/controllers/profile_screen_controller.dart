import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreenController extends GetxController {
  Rx<File>? profileImage = Rx<File>(File(""));

  RxBool showPassword = false.obs;

  void troglePassword() {
    showPassword.value = !showPassword.value;
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
