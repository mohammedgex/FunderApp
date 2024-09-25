import 'dart:convert';
import 'package:funder_app/app/data/apis_url.dart';
import 'package:funder_app/app/data/home/NotificationModel.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class NotificationsController extends GetxController {
  final box = GetStorage();
  static const String URL = ApiUrls.notification_api;

  Future<List> get_notifications() async {
    List<NotificationModel> notifications = [];
    try {
      print(box.read("userToken"));
      final response = await http.get(
        Uri.parse(URL),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read("userToken")}',
        },
      );

      if (response.statusCode == 200) {
        print("Conected");
        final List<dynamic> data = jsonDecode(response.body)["notifications"];
        print(data);
        notifications = data.map((e) => NotificationModel.fromJson(e)).toList();
        print("notifications $notifications");
      }
    } catch (error) {
      print("error : $error");
    }
    return notifications;
  }
}
