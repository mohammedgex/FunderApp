import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/modules/verifyId/controllers/verify_id_controller.dart';
import 'package:get/get.dart';

class UploadIdView extends GetView<VerifyIdController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back)),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "Upload your Passport",
                size: 24,
                weight: FontWeight.w700,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomText(
                      text: "Front Side",
                      size: 20,
                      weight: FontWeight.w500,
                    ),
                    Obx(() => GestureDetector(
                        onTap: () {
                          controller.PickfrontSide();
                        },
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: controller
                                          .frontSide!.value.path.isEmpty
                                      ? const NetworkImage(
                                          "https://s3-alpha-sig.figma.com/img/fdd5/0f28/a41849b95e4496b49e7766fe01096641?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=XFnDwDXclKJp-Ht~on2ErnYj1BG1p7dpjgUPN9U6NKrJCpuM2dUFVW84gXeX3yEiEwe1bKPEP0KFHMJYY1upPgxbIMxBw-sNO07enGlZD7wL10rUI544KEjrxEr5IalBWXKGTRiztnfaJt3CPVQ0ayRxY761Qy4aYh1MoKVSaoc~YkWFi1~aaITseS3YCZ5-l1rQUW4CRjyLbNl~~Pf~3s9Akv3vvfbLskDM8dul1eRyEAyhFwqY34hXawMwIbmyVxrQmX9I6ffmnfd57QngwK~kGWkjD78tnX5~c1DdwiXp48DaIsgz62sZni9nGRAJG1Gih5QTBKJDjwAnLPhtUA__")
                                      : FileImage(controller.frontSide!.value)
                                          as ImageProvider)),
                        )))
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Back Side",
                      size: 20,
                      weight: FontWeight.w500,
                    ),
                    Obx(() => GestureDetector(
                          onTap: () {
                            controller.PickbackSide();
                          },
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: controller
                                            .backSide!.value.path.isEmpty
                                        ? const NetworkImage(
                                            "https://s3-alpha-sig.figma.com/img/fdd5/0f28/a41849b95e4496b49e7766fe01096641?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=XFnDwDXclKJp-Ht~on2ErnYj1BG1p7dpjgUPN9U6NKrJCpuM2dUFVW84gXeX3yEiEwe1bKPEP0KFHMJYY1upPgxbIMxBw-sNO07enGlZD7wL10rUI544KEjrxEr5IalBWXKGTRiztnfaJt3CPVQ0ayRxY761Qy4aYh1MoKVSaoc~YkWFi1~aaITseS3YCZ5-l1rQUW4CRjyLbNl~~Pf~3s9Akv3vvfbLskDM8dul1eRyEAyhFwqY34hXawMwIbmyVxrQmX9I6ffmnfd57QngwK~kGWkjD78tnX5~c1DdwiXp48DaIsgz62sZni9nGRAJG1Gih5QTBKJDjwAnLPhtUA__")
                                        : FileImage(controller.backSide!.value)
                                            as ImageProvider)),
                          ),
                        ))
                  ],
                ),
              ),
              GestureDetector(
                  onTap: () async {
                    await controller.UPLOADID();
                  },
                  child: Obx(
                    () => controller.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Color.fromRGBO(236, 138, 35, 1),
                            ),
                          )
                        : const Center(
                            child: Button(
                              width: double.infinity,
                              text: "Next",
                              buttonColor: Color.fromRGBO(236, 138, 35, 1),
                            ),
                          ),
                  ))
            ],
          ),
        )));
  }
}
