import 'package:flutter/material.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../controllers/chat_support_controller.dart';

class ChatSupportView extends GetView<ChatSupportController> {
  const ChatSupportView({super.key});
  @override
  Widget build(BuildContext context) {
    String fontFamily =
        Get.locale?.languageCode == 'ar' ? 'Tajawal-Regular' : 'Lato';
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(
                'https://tawk.to/chat/672622cc4304e3196adc5285/1ibmffs54/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
          Uri.parse('https://tawk.to/chat/672622cc4304e3196adc5285/1ibmffs54'));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(236, 138, 35, 1),
        title: Text(
          "Live Chat".tr,
          style: TextStyle(
            color: Colors.white,
            fontFamily: fontFamily,
          ),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () => Get.offAllNamed(Routes.MAIN_PAGE),
          child: const Icon(
            color: Colors.white,
            Icons.cancel,
            size: 25,
          ),
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
