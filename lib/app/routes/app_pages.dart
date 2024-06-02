import 'package:get/get.dart';
import 'package:uas_flutter_absen/app/modules/forgotpassword/bindings/forgotpassword_binding.dart';
import 'package:uas_flutter_absen/app/modules/forgotpassword/views/forgotpassword_view.dart';
import 'package:uas_flutter_absen/app/modules/login/bindings/login_binding.dart';
import 'package:uas_flutter_absen/app/modules/login/views/login_view.dart';
import 'package:uas_flutter_absen/app/modules/register/bindings/register_binding.dart';
import 'package:uas_flutter_absen/app/modules/register/views/register_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

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
  ];
}
