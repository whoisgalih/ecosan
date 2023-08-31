import 'package:get/get.dart';

class FaqController extends GetxController {
  final List<Map<String, String>> sanitasiAirAccordionData = [
    {
      'header':
          'Apa saja service yang diberikan jika memesan perbaikan alat sanitasi air?',
      'content':
          'Service yang diberikan berupa pengecekan alat, pencarian sumber masalah yang membuat alat tidak berfungsi, hingga penggantian alat apabila dirasa sudah tidak bisa di perbaiki.'
    },
    {
      'header':
          'Apa saja service yang diberikan jika memesan perbaikan alat sanitasi air?',
      'content':
          'Service yang diberikan berupa pengecekan alat, pencarian sumber masalah yang membuat alat tidak berfungsi, hingga penggantian alat apabila dirasa sudah tidak bisa di perbaiki.'
    },
    {
      'header':
          'Apa saja service yang diberikan jika memesan perbaikan alat sanitasi air?',
      'content':
          'Service yang diberikan berupa pengecekan alat, pencarian sumber masalah yang membuat alat tidak berfungsi, hingga penggantian alat apabila dirasa sudah tidak bisa di perbaiki.'
    },
  ];

  final List<Map<String, String>> sanitasiSampahAccordionData = [
    {
      'header':
          'Apa saja service yang diberikan jika memesan perbaikan alat sanitasi limbah?',
      'content':
          'Service yang diberikan berupa pengecekan alat, pencarian sumber masalah yang membuat alat tidak berfungsi, hingga penggantian alat apabila dirasa sudah tidak bisa di perbaiki.'
    },
    {
      'header':
          'Apa saja service yang diberikan jika memesan perbaikan alat sanitasi limbah?',
      'content':
          'Service yang diberikan berupa pengecekan alat, pencarian sumber masalah yang membuat alat tidak berfungsi, hingga penggantian alat apabila dirasa sudah tidak bisa di perbaiki.'
    },
    {
      'header':
          'Apa saja service yang diberikan jika memesan perbaikan alat sanitasi limbah?',
      'content':
          'Service yang diberikan berupa pengecekan alat, pencarian sumber masalah yang membuat alat tidak berfungsi, hingga penggantian alat apabila dirasa sudah tidak bisa di perbaiki.'
    },
  ];
  final count = 0.obs;

  void increment() => count.value++;
}
