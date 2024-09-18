import 'package:flutter/material.dart';
import 'package:funder_app/app/modules/global_widgets/my_property.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/my_investments_controller.dart';

class MyInvestmentsView extends GetView<MyInvestmentsController> {
  MyInvestmentsView({super.key});

  int pageNumIndex = 0;

  @override
  Widget build(BuildContext context) {
    print(pageNumIndex);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: CustomText(
          text: "My properties".tr,
        ),
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(
                      2,
                      (index) => GestureDetector(
                            onTap: () {
                              controller.select_Type(index);
                              pageNumIndex = index;
                            },
                            child: Obx(() => Container(
                                  width: 127.5,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          width: 1,
                                          color: const Color.fromRGBO(
                                              4, 54, 61, 1)),
                                      color: controller
                                                  .Is_Selected_type.value ==
                                              index
                                          ? const Color.fromRGBO(4, 54, 61, 1)
                                          : Colors.white),
                                  height: 40,
                                  child: Center(
                                    child: CustomText(
                                      text: controller.list[index].tr,
                                      size: 16,
                                      color: controller
                                                  .Is_Selected_type.value ==
                                              index
                                          ? Colors.white
                                          : const Color.fromRGBO(4, 54, 61, 1),
                                      weight: FontWeight.w400,
                                    ),
                                  ),
                                )),
                          ))
                ],
              ),
            ),
            Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: Obx(() => FutureBuilder(
                    future: controller.Is_Selected_type.value == 0
                        ? controller.get_MyProperties()
                        : controller.get_MyPendingProperties(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: Lottie.asset('assets/loading.json',
                              width: 100, height: 100),
                        );
                      }
                      return snapshot.data!.isEmpty
                          ? Center(
                              child: CustomText(
                              text: "No Properties Found",
                            ))
                          : SizedBox(
                              height: MediaQuery.of(context).size.height - 400,
                              child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    return my_Property(
                                        title: snapshot.data![index].name,
                                        price: snapshot
                                            .data![index].propertyPrice
                                            .toString(),
                                        imageUrl:
                                            snapshot.data![index].images[0],
                                        rent: snapshot.data![index].rentalIncome
                                            .toString(),
                                        id: snapshot.data![index].id,
                                        pending:
                                            controller.Is_Selected_type.value ==
                                                1,
                                        property: snapshot.data![index]);
                                  }),
                            );
                    })))
          ],
        ),
      ),
    );
  }
}
