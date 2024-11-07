import 'package:flutter/material.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/notifications_controller.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: CustomText(
          text: "Notifications".tr,
          size: 20,
          weight: FontWeight.w600,
        ),
      ),
      body: FutureBuilder(
        future: controller.get_notifications(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child:
                  Lottie.asset('assets/loading.json', width: 100, height: 100),
            );
          }

          // Get today's and yesterday's dates
          DateTime now = DateTime.now();
          DateTime today = DateTime(now.year, now.month, now.day);
          DateTime yesterday = today.subtract(const Duration(days: 1));

          // Filter notifications
          var todayNotifications = snapshot.data!.where((notification) {
            DateTime createdAt = notification.createdAt;
            return createdAt.isAfter(today);
          }).toList();

          var yesterdayNotifications = snapshot.data!.where((notification) {
            DateTime createdAt = notification.createdAt;
            return createdAt.isAfter(yesterday) && createdAt.isBefore(today);
          }).toList();

          var oldNotifications = snapshot.data!.where((notification) {
            DateTime createdAt = notification.createdAt;
            return createdAt.isBefore(yesterday);
          }).toList();

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // Today Notifications Section
                  if (todayNotifications.isNotEmpty)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Today".tr,
                          size: 20,
                          weight: FontWeight.w600,
                        ),
                        const SizedBox(height: 15),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: todayNotifications.length,
                          itemBuilder: (context, index) {
                            return _buildNotificationItem(
                                context, todayNotifications[index]);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider(
                              color: Color.fromRGBO(149, 149, 149, 0.3),
                            );
                          },
                        ),
                      ],
                    ),

                  const SizedBox(height: 20),

                  // Yesterday Notifications Section
                  if (yesterdayNotifications.isNotEmpty)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Yesterday".tr,
                          size: 20,
                          weight: FontWeight.w600,
                        ),
                        const SizedBox(height: 15),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: yesterdayNotifications.length,
                          itemBuilder: (context, index) {
                            return _buildNotificationItem(
                                context, yesterdayNotifications[index]);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider(
                              color: Color.fromRGBO(149, 149, 149, 0.3),
                            );
                          },
                        ),
                      ],
                    ),

                  const SizedBox(height: 20),

                  // Old Notifications Section
                  if (oldNotifications.isNotEmpty)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Old Notifications".tr,
                          size: 20,
                          weight: FontWeight.w600,
                        ),
                        const SizedBox(height: 15),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: oldNotifications.length,
                          itemBuilder: (context, index) {
                            return _buildNotificationItem(
                                context, oldNotifications[index]);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider(
                              color: Color.fromRGBO(149, 149, 149, 0.3),
                            );
                          },
                        ),
                      ],
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // A helper function to build a notification item
  Widget _buildNotificationItem(BuildContext context, dynamic notification) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(236, 138, 35, 0.2),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: const Icon(
            Icons.timer,
            color: Color.fromRGBO(236, 138, 35, 1),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              softWrap: true,
              notification.data.title,
              style: const TextStyle(
                fontFamily: "Poppins-Light",
                fontSize: 14,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 150,
              child: Text(
                softWrap: true,
                notification.data.body,
                style: const TextStyle(
                  fontFamily: "Poppins-Light",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 35,
          child: Text(
            timeago.format(notification.createdAt),
            maxLines: null,
            overflow: TextOverflow.visible,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
