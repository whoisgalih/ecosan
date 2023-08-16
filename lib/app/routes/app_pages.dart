import 'package:get/get.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/register/bindings/register_binding.dart';
import '../modules/auth/register/data-diri/bindings/data_diri_binding.dart';
import '../modules/auth/register/data-diri/views/data_diri_view.dart';
import '../modules/auth/register/views/register_view.dart';
import '../modules/auth/register/welcome/bindings/welcome_binding.dart';
import '../modules/auth/register/welcome/views/welcome_view.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
      children: [
        GetPage(
          name: _Paths.LOGIN,
          page: () => const LoginView(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: _Paths.REGISTER,
          page: () => const RegisterView(),
          binding: RegisterBinding(),
          children: [
            GetPage(
              name: _Paths.WELCOME,
              page: () => const WelcomeView(),
              binding: WelcomeBinding(),
            ),
            GetPage(
              name: _Paths.DATA_DIRI,
              page: () => const DataDiriView(),
              binding: DataDiriBinding(),
            ),
          ],
        ),
      ],
    ),
  ];
}