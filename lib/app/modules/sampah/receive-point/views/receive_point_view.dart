import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/receive_point_controller.dart';

class ReceivePointView extends GetView<ReceivePointController> {
  const ReceivePointView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReceivePointView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ReceivePointView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
