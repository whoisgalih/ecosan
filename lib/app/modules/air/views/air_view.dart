import 'package:ecosan/app/modules/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/air_controller.dart';

class AirView extends GetView<AirController> {
  const AirView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AirView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AirView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
