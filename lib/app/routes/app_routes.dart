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
  static const AIR = _Paths.AIR;
  static const SAMPAH = _Paths.SAMPAH;
  static const PROFILE = _Paths.PROFILE;
  static const DAFTAR_RIWAYAT = _Paths.HOME + _Paths.DAFTAR_RIWAYAT;
  static const POINKU = _Paths.HOME + _Paths.POINKU;
  static const VOUCHEREXCHANGE =
      _Paths.HOME + _Paths.POINKU + _Paths.VOUCHEREXCHANGE;
  static const VOUCHERKU = _Paths.HOME + _Paths.VOUCHERKU;
  static const EDIT = _Paths.HOME + _Paths.EDIT;
  static const FAQ = _Paths.HOME + _Paths.FAQ;
  static const CONTACT = _Paths.HOME + _Paths.CONTACT;
  static const PEMBERSIHAN_FILTER = _Paths.AIR + _Paths.PEMBERSIHAN_FILTER;
  static const PEMASANGAN_ALAT = _Paths.AIR + _Paths.PEMASANGAN_ALAT;
  static const METODE_PEMBAYARAN = _Paths.HOME + _Paths.METODE_PEMBAYARAN;
  static const PICKUP_POINT = _Paths.SAMPAH + _Paths.PICKUP_POINT;
  static const REVIEW_PICKUP_POINT =
      _Paths.SAMPAH + _Paths.PICKUP_POINT + _Paths.REVIEW_PICKUP_POINT;
  static const KONFIRMASI_KURIR = _Paths.SAMPAH +
      _Paths.PICKUP_POINT +
      _Paths.REVIEW_PICKUP_POINT +
      _Paths.KONFIRMASI_KURIR;
  static const PICKUP_HISTORY =
      _Paths.SAMPAH + _Paths.PICKUP_POINT + _Paths.PICKUP_HISTORY;
  static const CLAIM = _Paths.SAMPAH +
      _Paths.PICKUP_POINT +
      _Paths.PICKUP_HISTORY +
      _Paths.CLAIM;
  static const RECEIVE_POINT = _Paths.SAMPAH + _Paths.RECEIVE_POINT;
  static const DROP_POINT = _Paths.SAMPAH + _Paths.DROP_POINT;
  static const KODE_BAYAR =
      _Paths.HOME + _Paths.METODE_PEMBAYARAN + _Paths.KODE_BAYAR;
  static const TRANSACTION_SUCCESS = _Paths.HOME + _Paths.TRANSACTION_SUCCESS;
  static const PREVIEW_DROP_POINT =
      _Paths.SAMPAH + _Paths.DROP_POINT + _Paths.PREVIEW_DROP_POINT;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const AUTH = '/auth';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const WELCOME = '/welcome';
  static const DATA_DIRI = '/data-diri';
  static const AIR = '/air';
  static const SAMPAH = '/sampah';
  static const PROFILE = '/profile';
  static const DAFTAR_RIWAYAT = '/daftar-riwayat';
  static const POINKU = '/poinku';
  static const VOUCHEREXCHANGE = '/voucherexchange';
  static const VOUCHERKU = '/voucherku';
  static const EDIT = '/edit';
  static const FAQ = '/faq';
  static const CONTACT = '/contact';
  static const PEMBERSIHAN_FILTER = '/pembersihan-filter';
  static const PEMASANGAN_ALAT = '/pemasangan-alat';
  static const METODE_PEMBAYARAN = '/metode-pembayaran';
  static const PICKUP_POINT = '/pickup-point';
  static const REVIEW_PICKUP_POINT = '/review-pickup-point';
  static const KONFIRMASI_KURIR = '/konfirmasi-kurir';
  static const PICKUP_HISTORY = '/pickup-history';
  static const CLAIM = '/claim';
  static const RECEIVE_POINT = '/receive-point';
  static const DROP_POINT = '/drop-point';
  static const KODE_BAYAR = '/kode-bayar';
  static const TRANSACTION_SUCCESS = '/transaction-success';
  static const PREVIEW_DROP_POINT = '/preview-drop-point';
}
