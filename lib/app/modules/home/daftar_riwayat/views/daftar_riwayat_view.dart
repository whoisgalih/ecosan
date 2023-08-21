import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/daftar_riwayat_controller.dart';

class DaftarRiwayatView extends GetView<DaftarRiwayatController> {
  const DaftarRiwayatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DaftarRiwayatView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DaftarRiwayatView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
