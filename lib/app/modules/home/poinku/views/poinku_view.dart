import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/poinku_controller.dart';

class PoinkuView extends GetView<PoinkuController> {
  const PoinkuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PoinkuView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PoinkuView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
