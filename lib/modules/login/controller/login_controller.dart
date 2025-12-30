import 'package:assignment_koder/model/login_model.dart';
import 'package:assignment_koder/repositories/user_repository.dart';
import 'package:assignment_koder/routes/app_pages.dart';
import 'package:assignment_koder/utils/app_logger.dart';
import 'package:assignment_koder/utils/constants.dart';
import 'package:assignment_koder/utils/network_requester.dart';
import 'package:assignment_koder/utils/storage.dart';
import 'package:assignment_koder/widgets/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController  extends GetxController{

  UserRepository userRepository = UserRepository(); // Instance of UserRepository
  GlobalKey<FormState> formKey=GlobalKey();

  RxString username="".obs;
  RxString password="".obs;
  RxBool obscurePassword=true.obs;
  RxBool isLoading=false.obs;
  LoginModel loginData=LoginModel();

  Future<bool> loginUser()async{
    bool result=false;
    isLoading(true);
    try{
      Map<String,dynamic> reqData={
        "username":username.value.trim(),
        "password":password.value.trim()
      };
      // API method call from repository
      loginData=await userRepository.loginUser(reqData);

      if(loginData.token!=null && loginData.token!=""){
        // Storing token to maintain session
        Storage.token=loginData.token;
        // Show success toast notification
        showSuccessToast("Login success");
        // Redefining the network requestor class to add the token in API calls
        NetworkRequester.shared.prepareRequest();
        // Routing to dashboard
        Get.offAllNamed(Routes.dashboard);
      }
    }catch(e,stack){
      showErrorToast(ErrorMessages.networkGeneral);
    }
    isLoading(false);
    return result;
  }
}