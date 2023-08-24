import 'package:get/get.dart';

import '../modules/air/bindings/air_binding.dart';
import '../modules/air/pemasangan_alat/bindings/pemasangan_alat_binding.dart';
import '../modules/air/pemasangan_alat/views/pemasangan_alat_view.dart';
import '../modules/air/pembersihan_filter/bindings/pembersihan_filter_binding.dart';
import '../modules/air/pembersihan_filter/views/pembersihan_filter_view.dart';
import '../modules/air/views/air_view.dart';
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
import '../modules/home/contact/bindings/contact_binding.dart';
import '../modules/home/contact/views/contact_view.dart';
import '../modules/home/daftar_riwayat/bindings/daftar_riwayat_binding.dart';
import '../modules/home/daftar_riwayat/views/daftar_riwayat_view.dart';
import '../modules/home/edit/bindings/edit_binding.dart';
import '../modules/home/edit/views/edit_view.dart';
import '../modules/home/faq/bindings/faq_binding.dart';
import '../modules/home/faq/views/faq_view.dart';
import '../modules/home/kode_bayar/bindings/kode_bayar_binding.dart';
import '../modules/home/kode_bayar/views/kode_bayar_view.dart';
import '../modules/home/metode_pembayaran/bindings/metode_pembayaran_binding.dart';
import '../modules/home/metode_pembayaran/views/metode_pembayaran_view.dart';
import '../modules/home/poinku/bindings/poinku_binding.dart';
import '../modules/home/poinku/views/poinku_view.dart';
import '../modules/home/poinku/voucherexchange/bindings/voucherexchange_binding.dart';
import '../modules/home/poinku/voucherexchange/views/voucherexchange_view.dart';
import '../modules/home/transaction_success/bindings/transaction_success_binding.dart';
import '../modules/home/transaction_success/views/transaction_success_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/voucherku/bindings/voucherku_binding.dart';
import '../modules/home/voucherku/views/voucherku_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/sampah/bindings/sampah_binding.dart';
import '../modules/sampah/views/sampah_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.noTransition,
      children: [
        GetPage(
          name: _Paths.DAFTAR_RIWAYAT,
          page: () => const DaftarRiwayatView(),
          binding: DaftarRiwayatBinding(),
        ),
        GetPage(
          name: _Paths.POINKU,
          page: () => const PoinkuView(),
          binding: PoinkuBinding(),
          children: [
            GetPage(
              name: _Paths.VOUCHEREXCHANGE,
              page: () => VoucherexchangeView(),
              binding: VoucherexchangeBinding(),
            ),
          ],
        ),
        GetPage(
          name: _Paths.VOUCHERKU,
          page: () => const VoucherkuView(),
          binding: VoucherkuBinding(),
        ),
        GetPage(
          name: _Paths.EDIT,
          page: () => const EditView(),
          binding: EditBinding(),
        ),
        GetPage(
          name: _Paths.FAQ,
          page: () => const FaqView(),
          binding: FaqBinding(),
        ),
        GetPage(
          name: _Paths.CONTACT,
          page: () => const ContactView(),
          binding: ContactBinding(),
        ),
        GetPage(
          name: _Paths.METODE_PEMBAYARAN,
          page: () => const MetodePembayaranView(),
          binding: MetodePembayaranBinding(),
        ),
        GetPage(
          name: _Paths.KODE_BAYAR,
          page: () => const KodeBayarView(),
          binding: KodeBayarBinding(),
        ),
        GetPage(
          name: _Paths.TRANSACTION_SUCCESS,
          page: () => const TransactionSuccessView(),
          binding: TransactionSuccessBinding(),
        ),
      ],
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
          transition: Transition.noTransition,
        ),
        GetPage(
          name: _Paths.REGISTER,
          page: () => const RegisterView(),
          binding: RegisterBinding(),
          transition: Transition.noTransition,
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
    GetPage(
        name: _Paths.AIR,
        page: () => const AirView(),
        binding: AirBinding(),
        transition: Transition.noTransition,
        children: [
          GetPage(
            name: _Paths.PEMBERSIHAN_FILTER,
            page: () => const PembersihanFilterView(),
            binding: PembersihanFilterBinding(),
          ),
          GetPage(
            name: _Paths.PEMASANGAN_ALAT,
            page: () => const PemasanganAlatView(),
            binding: PemasanganAlatBinding(),
          ),
        ]),
    GetPage(
      name: _Paths.SAMPAH,
      page: () => const SampahView(),
      binding: SampahBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
      transition: Transition.noTransition,
    ),
  ];
}
