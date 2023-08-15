import 'package:ecosan/app/modules/auth/controllers/auth_controller.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/routes/app_pages.dart';
import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
      title: 'EcoSan',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: EcoSanColors.primary,
          accentColor: EcoSanColors.secondary,
          errorColor: EcoSanColors.error,
        ),
        textTheme: TextTheme(
          titleLarge: TextStyles.header1.bold(),
          titleMedium: TextStyles.header2.bold(),
          titleSmall: TextStyles.header3.bold(),
          bodyLarge: TextStyles.normal,
          bodyMedium: TextStyles.small,
          bodySmall: TextStyles.tiny,
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: EcoSanColors.primary[300]!),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: EcoSanColors.primary[300]!),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          contentPadding: EdgeInsets.all(12),
          prefixIconColor: EcoSanColors.primary,
          hintStyle: TextStyles.tiny,
        ),
      ),
    );
  }
}
