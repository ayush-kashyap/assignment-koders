import 'package:assignment_koder/routes/app_pages.dart';
import 'package:assignment_koder/utils/storage.dart';
import 'package:get/get.dart';

class AppUtils {
  logout() {
    Storage.clear();
    Get.offAllNamed(Routes.login);
  }

  static bool isLoggedIn() => Storage.token != null && Storage.token != "";
}
