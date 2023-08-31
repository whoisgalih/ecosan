import 'package:ecosan/app/modules/auth/controllers/auth_controller.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/routes/app_pages.dart';
import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sizer/sizer.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(AuthController());
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
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
                borderSide:
                    BorderSide(width: 1, color: EcoSanColors.primary[300]!),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 2, color: EcoSanColors.primary[300]!),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              errorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: EcoSanColors.error[300]!),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 2, color: EcoSanColors.error[300]!),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              contentPadding: const EdgeInsets.all(12),
              prefixIconColor: EcoSanColors.primary,
              hintStyle: TextStyles.tiny,
            ),
            appBarTheme: AppBarTheme(
              actionsIconTheme: const IconThemeData(
                size: 24,
                color: Colors.white,
              ),
              backgroundColor: EcoSanColors.primary,
              foregroundColor: Colors.white,
              titleTextStyle: TextStyles.header3.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              centerTitle: false,
              elevation: 0,
              titleSpacing: 0,
            ),
          ),
        );
      },
    );
  }
}
