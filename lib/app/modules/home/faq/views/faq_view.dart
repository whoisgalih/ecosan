import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/faq_controller.dart';

class FaqView extends GetView<FaqController> {
  const FaqView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FaqView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FaqView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
