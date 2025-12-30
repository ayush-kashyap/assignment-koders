import 'package:assignment_koder/Modules/splash/view/splash_view.dart';
import 'package:assignment_koder/modules/dashboard/view/dashboard_view.dart';
import 'package:assignment_koder/modules/login/view/login_view.dart';
import 'package:assignment_koder/modules/product_view/view/product_view.dart';
import 'package:get/get.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.splash, page: () => const SplashView()),
    GetPage(name: Routes.login, page: () => const LoginView()),
    GetPage(name: Routes.dashboard, page: () => const DashboardView()),
    GetPage(name: Routes.product, page: () => const ProductView()),

  ];
}
