import 'dart:convert';
import 'package:funder_app/app/data/apis_url.dart';
import 'package:http/http.dart' as http;
import 'package:funder_app/app/data/Auth/TermsModal.dart';
import 'package:get/get.dart';

class TermsController extends GetxController {
  Future<List<TermModal>> fetchTerms() async {
    final response = await http.get(
      Uri.parse('${ApiUrls.URl}/api/terms'),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body)["terms"];
      return jsonResponse.map((data) => TermModal.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load terms');
    }
  }
}
