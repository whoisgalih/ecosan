import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'assets/images/ecosan_horizontal_logo.png',
        ),
        actions: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: Image.asset(
              'assets/images/ecosan_vertical_logo.png',
              fit: BoxFit.contain,
              scale: 0.5,
            ),
          ),
          IconButton(
            onPressed: () {
              controller.signOut();
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: const Center(),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.water_drop), label: "Air"),
            BottomNavigationBarItem(
                icon: Icon(Icons.recycling), label: "Sampah"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          currentIndex: controller.index.value,
          onTap: (index) {
            controller.index.value = index;
          },
        ),
      ),
    );
  }
}
