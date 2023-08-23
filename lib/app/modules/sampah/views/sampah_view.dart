import 'package:ecosan/app/modules/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sampah_controller.dart';

class SampahView extends GetView<SampahController> {
  const SampahView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SampahView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SampahView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}