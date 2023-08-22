part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const AUTH = _Paths.AUTH;
  static const LOGIN = _Paths.AUTH + _Paths.LOGIN;
  static const REGISTER = _Paths.AUTH + _Paths.REGISTER;
  static const WELCOME = _Paths.AUTH + _Paths.REGISTER + _Paths.WELCOME;
  static const DATA_DIRI = _Paths.AUTH + _Paths.REGISTER + _Paths.DATA_DIRI;
  static const DAFTAR_RIWAYAT = _Paths.HOME + _Paths.DAFTAR_RIWAYAT;
  static const POINKU = _Paths.HOME + _Paths.POINKU;
  static const VOUCHEREXCHANGE =
      _Paths.HOME + _Paths.POINKU + _Paths.VOUCHEREXCHANGE;
  static const VOUCHERKU = _Paths.HOME + _Paths.VOUCHERKU;
  static const EDIT = _Paths.HOME + _Paths.EDIT;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const AUTH = '/auth';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const WELCOME = '/welcome';
  static const DATA_DIRI = '/data-diri';
  static const DAFTAR_RIWAYAT = '/daftar-riwayat';
  static const POINKU = '/poinku';
  static const VOUCHEREXCHANGE = '/voucherexchange';
  static const VOUCHERKU = '/voucherku';
  static const EDIT = '/edit';
}
