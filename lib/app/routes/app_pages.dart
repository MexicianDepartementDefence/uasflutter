import 'package:get/get.dart';

import '../modules/crud_jadwal/bindings/crud_jadwal_binding.dart';
import '../modules/crud_jadwal/views/crud_jadwal_view.dart';
import '../modules/forgotpassword/bindings/forgotpassword_binding.dart';
import '../modules/forgotpassword/views/forgotpassword_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/tambah-jadwal/bindings/tambah_jadwal_binding.dart';
import '../modules/tambah-jadwal/views/tambah_jadwal_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.FORGOTPASSWORD,
      page: () => ForgotPasswordView(),
      binding: ForgotpasswordBinding(),
    ),
    GetPage(
      name: _Paths.CRUD_JADWAL,
      page: () => CrudJadwalView(),
      binding: CrudJadwalBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_JADWAL,
      page: () => const TambahJadwalView(),
      binding: TambahJadwalBinding(),
    ),
  ];
}
