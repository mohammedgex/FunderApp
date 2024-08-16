import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';

import 'package:get/get.dart';

import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: CustomText(
          text: "Notifications",
          size: 20,
          weight: FontWeight.w600,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Today",
                  size: 20,
                  weight: FontWeight.w600,
                ),
                const SizedBox(height: 15),
                Container(
                  height: 170,
                  child: ListView.separated(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(236, 138, 35, 0.2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child: const Icon(
                              Icons.timer,
                              color: Color.fromRGBO(236, 138, 35, 1),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                softWrap: true,
                                "Discount 20% ",
                                style: TextStyle(
                                    fontFamily: "Poppins-Light",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 150,
                                child: const Text(
                                  softWrap: true,
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem",
                                  style: TextStyle(
                                      fontFamily: "Poppins-Light",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                          CustomText(
                            text: "1 hr",
                            size: 12,
                            weight: FontWeight.w400,
                          )
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        color: Color.fromRGBO(149, 149, 149, 0.3),
                      );
                    },
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Yesterday",
                  size: 20,
                  weight: FontWeight.w600,
                ),
                const SizedBox(height: 15),
                Container(
                  height: 170,
                  child: ListView.separated(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(236, 138, 35, 0.2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child: const Icon(
                              Icons.notification_important,
                              color: Color.fromRGBO(236, 138, 35, 1),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                softWrap: true,
                                "Discount 20% ",
                                style: TextStyle(
                                    fontFamily: "Poppins-Light",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 150,
                                child: const Text(
                                  softWrap: true,
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem",
                                  style: TextStyle(
                                      fontFamily: "Poppins-Light",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                          CustomText(
                            text: "1 hr",
                            size: 12,
                            weight: FontWeight.w400,
                          )
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        color: Color.fromRGBO(149, 149, 149, 0.3),
                      );
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
