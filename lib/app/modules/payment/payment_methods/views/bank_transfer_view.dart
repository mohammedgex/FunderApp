import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BankTransferView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BankTransferView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'BankTransferView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
