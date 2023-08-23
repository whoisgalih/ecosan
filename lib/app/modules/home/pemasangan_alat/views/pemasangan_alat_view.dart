import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pemasangan_alat_controller.dart';

class PemasanganAlatView extends GetView<PemasanganAlatController> {
  const PemasanganAlatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PemasanganAlatView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PemasanganAlatView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
