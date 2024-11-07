import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funder_app/app/data/apis_url.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/profilerow.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/modules/home/navigated_screens/profile_Screen/controllers/profile_screen_controller.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreenView extends GetView<ProfileScreenController> {
  @override
  Widget build(BuildContext context) {
    final ProfileScreenController controller =
        Get.put(ProfileScreenController());
    final box = GetStorage();
    DateTime? lastPressed;

    return WillPopScope(
      onWillPop: () async {
        final now = DateTime.now();
        const maxDuration = Duration(seconds: 2);

        if (lastPressed == null || now.difference(lastPressed!) > maxDuration) {
          lastPressed = now;

          // Navigate to the main route on the first back press
          Get.offAllNamed(Routes.MAIN_PAGE);
          return false;
        }

        // Exit the app on the second back press within 2 seconds
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: FutureBuilder(
            future: controller.getUserIdentificaion(),
            builder: (context, snapshotDate) {
              return Obx(() => controller.isLoading.value
                  ? _buildLoadingIndicator()
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _buildProfileInfo(
                                context, controller, snapshotDate, box),
                            _buildProfileOptions(
                                context, controller, snapshotDate),
                          ],
                        ),
                      ),
                    ));
            },
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfo(
      BuildContext context,
      ProfileScreenController controller,
      AsyncSnapshot snapshotDate,
      GetStorage box) {
    return FutureBuilder(
      future: controller.getUserDate(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildLoadingIndicator();
        }

        return Column(
          children: [
            _buildProfileImage(snapshot),
            const SizedBox(height: 14),
            _buildProfileDetails(snapshot),
            const SizedBox(height: 14),
            _buildVerificationStatus(
                context, controller, snapshotDate, box, snapshot),
          ],
        );
      },
    );
  }

  Widget _buildProfileImage(AsyncSnapshot snapshot) {
    return SizedBox(
      width: 132,
      height: 132,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.network(
          "${ApiUrls.URl}/storage/${snapshot.data!.image}",
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => _buildErrorImage(),
        ),
      ),
    );
  }

  Widget _buildErrorImage() {
    return Container(
      width: 132,
      height: 132,
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(8)),
      child: CustomText(text: "Error"),
    );
  }

  Widget _buildProfileDetails(AsyncSnapshot snapshot) {
    return Column(
      children: [
        CustomText(
            text: snapshot.data!.name,
            color: const Color.fromRGBO(4, 54, 61, 1),
            weight: FontWeight.w500,
            size: 16),
        CustomText(
            text: snapshot.data!.phone,
            color: const Color.fromRGBO(4, 54, 61, 1),
            size: 12,
            weight: FontWeight.w500),
      ],
    );
  }

  Widget _buildVerificationStatus(
      BuildContext context,
      ProfileScreenController controller,
      AsyncSnapshot snapshotDate,
      GetStorage box,
      AsyncSnapshot snapshot) {
    return GestureDetector(
      onTap: () {
        if (controller.isNotIdentiy!) {
          box.write("registeredEmail", snapshot.data!.email);
          Get.toNamed(Routes.SELECT_TYPE, arguments: {"isUpdate": false});
        }
      },
      child: Column(
        children: [
          _buildStatusContainer(controller, snapshotDate),
          const SizedBox(height: 2),
          _buildUpdateIdentification(controller, snapshotDate),
        ],
      ),
    );
  }

  Widget _buildStatusContainer(
      ProfileScreenController controller, AsyncSnapshot snapshotDate) {
    Color statusColor = _getStatusColor(snapshotDate.data?.status);
    String statusText =
        _getStatusText(controller.isNotIdentiy!, snapshotDate.data?.status);

    return Container(
      width: controller.isNotIdentiy! ? 100 : 60,
      height: 25,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: statusColor, borderRadius: BorderRadius.circular(6)),
      child: Center(
        child: CustomText(
            text: statusText,
            color: Colors.white,
            size: 12,
            weight: FontWeight.w500),
      ),
    );
  }

  Widget _buildUpdateIdentification(
      ProfileScreenController controller, AsyncSnapshot snapshotDate) {
    if (controller.isNotIdentiy! ||
        snapshotDate.data?.status == "valid" ||
        snapshotDate.data?.status == "Waiting") {
      return const SizedBox();
    }

    return snapshotDate.data!.notes != null
        ? CustomText(
            text: snapshotDate.data!.notes,
            color: Colors.red,
            size: 12,
            weight: FontWeight.w500)
        : const SizedBox();
  }

  Widget _buildProfileOptions(BuildContext context,
      ProfileScreenController controller, AsyncSnapshot snapshotDate) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            _buildProfileOptionTile(snapshotDate, "Personal details".tr,
                "assets/person_Icon.svg", Routes.PERSONALDETAILS_PAGE),
            const SizedBox(height: 35),
            _buildUpdateIdentificationTile(controller, snapshotDate),
            if (controller.isNotIdentiy == true ||
                snapshotDate.data?.status == "valid" ||
                snapshotDate.data?.status == "Waiting")
              const SizedBox(height: 0)
            else
              const SizedBox(height: 35),
            _buildLanguageChangeTile(),
            const SizedBox(height: 35),
            GestureDetector(
              onTap: () async {
                const url = 'https://wa.me/201273931793';

                await launchUrl(Uri.parse(url),
                    mode: LaunchMode.externalApplication);
              },
              child: ProfileTile(
                  text: "Contact via whatsapp".tr, path: "assets/whatsapp.svg"),
            ),
            const SizedBox(height: 35),
            GestureDetector(
                onTap: () => Get.toNamed(Routes.CHAT_SUPPORT),
                child: ProfileTile(
                    text: "Live Chat".tr, path: "assets/liveChat.svg")),
            const SizedBox(height: 35),
            _buildTermsButton(context, controller),
            const SizedBox(height: 35),
            _buildLogoutTile(context, controller),
            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }

  Widget _buildTermsButton(
      BuildContext context, ProfileScreenController controller) {
    return GestureDetector(
      onTap: () {
        Get.offAllNamed(Routes.HOME, arguments: {"isTerms": true});
      },
      child: ProfileTile(text: "How to use app".tr, path: "assets/howuse.svg"),
    );
  }

  Widget _buildProfileOptionTile(
      AsyncSnapshot snapshotDate, String text, String path, String route) {
    return InkWell(
      onTap: () => Get.toNamed(
        route,
        arguments: {
          "id": snapshotDate.data?.id,
          // "type": snapshotDate.data?.type, // Uncomment if type is used
          "isUpdate": true,
          "frontSide": snapshotDate.data?.frontSide,
          "backSide": snapshotDate.data?.backSide,
        },
      ),
      child: ProfileTile(text: text, path: path),
    );
  }

  Widget _buildUpdateIdentificationTile(
      ProfileScreenController controller, AsyncSnapshot snapshotDate) {
    if (controller.isNotIdentiy == true ||
        snapshotDate.data?.status == "valid" ||
        snapshotDate.data?.status == "Waiting") {
      return const SizedBox(
        height: 0,
      );
    }

    return _buildProfileOptionTile(
      snapshotDate,
      "Update identification",
      "assets/person_Icon.svg",
      Routes.SELECT_TYPE,
    );
  }

  Widget _buildLanguageChangeTile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              "assets/settings.svg",
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 8),
            CustomText(
                text: "change language".tr,
                size: 16,
                weight: FontWeight.w600,
                color: const Color.fromRGBO(4, 54, 61, 1)),
          ],
        ),
        const SizedBox(),
        DropdownButton<Locale>(
          dropdownColor: Colors.white,
          elevation: 4,
          value: Get.locale,
          items: [
            DropdownMenuItem(
                value: const Locale('en', 'US'),
                child: CustomText(text: 'English')),
            DropdownMenuItem(
                value: const Locale('ar', 'AE'),
                child: CustomText(text: 'العربية')),
          ],
          onChanged: (Locale? locale) {
            if (locale != null) {
              final storage = GetStorage();
              storage.write('languageCode', locale.languageCode);
              storage.write('countryCode', locale.countryCode);
              Get.updateLocale(locale);
            }
          },
        ),
      ],
    );
  }

  Widget _buildLogoutTile(
      BuildContext context, ProfileScreenController controller) {
    return InkWell(
      onTap: () => showDialog(
        context: context,
        barrierDismissible: true, // Allows dismissing by tapping outside
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: SizedBox.shrink(), // Empty title space
            content: Column(
              mainAxisSize: MainAxisSize.min, // Makes the dialog compact
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/splashLogo.png",
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 10),
                CustomText(
                    text: "log out".tr,
                    color: const Color.fromRGBO(4, 54, 61, 1),
                    size: 15,
                    weight: FontWeight.w500),
                CustomText(
                    text: "Are you sure want to log out?".tr,
                    size: 14,
                    cenetr: true,
                    weight: FontWeight.w400,
                    color: const Color.fromRGBO(148, 148, 148, 1)),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    // Implement your controller clearToken and navigation logic
                    // controller.clearToken();
                    Navigator.of(context).pop(); // Dismiss the dialog
                    Get.offAllNamed(Routes.LOGIN); // Redirect to login
                  },
                  child: _buildLogoutButton(context, controller),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(); // Dismiss the dialog
                  },
                  child: _buildCancelButton(context),
                ),
              ],
            ),
          );
        },
      ),
      child: ProfileTile(text: "log out".tr, path: "assets/signout.svg"),
    );
  }

  Widget _buildLogoutButton(
      BuildContext context, ProfileScreenController controller) {
    return Button(
      width: 252,
      text: "log out".tr,
      buttonColor: const Color.fromRGBO(236, 138, 35, 1),
    );
  }

  Widget _buildCancelButton(BuildContext context) {
    return Button(
      width: 252,
      text: "Cancel".tr,
      isBorder: true,
      buttonColor: const Color.fromRGBO(255, 255, 255, 1),
    );
  }

  Widget _buildLoadingIndicator() {
    return Center(
      child: Lottie.asset('assets/loading.json', width: 100, height: 100),
    );
  }

  String _getStatusText(bool isNotIdentiy, String? status) {
    if (isNotIdentiy) return "verify account";
    switch (status) {
      case "valid":
        return "Verified";
      case "Waiting":
        return "Waiting";
      default:
        return "Failed";
    }
  }

  Color _getStatusColor(String? status) {
    switch (status) {
      case "valid":
        return Colors.green;
      case "Waiting":
        return Colors.orange;
      default:
        return Colors.red;
    }
  }
}
