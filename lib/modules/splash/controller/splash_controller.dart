import 'package:assignment_koder/routes/app_pages.dart';
import 'package:assignment_koder/utils/app_logger.dart';
import 'package:assignment_koder/utils/app_utils.dart';
import 'package:assignment_koder/utils/storage.dart';
import 'package:get/get.dart';

class SplashController  extends GetxController{
  bool isLoggedIn=AppUtils.isLoggedIn(); // Fetch user session status
@override
  void onInit() {
    // Conditional Routing based on session exists or not?
    if(isLoggedIn){
      Future.delayed(Duration(seconds: 3),(){
        Get.offAllNamed(Routes.dashboard);
      });
    }else{
      Future.delayed(Duration(seconds: 3),(){
        Get.offAllNamed(Routes.login);
      });
    }
    super.onInit();
  }

}