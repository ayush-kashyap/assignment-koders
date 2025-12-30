import 'package:assignment_koder/model/product_model.dart';
import 'package:assignment_koder/repositories/product_repository.dart';
import 'package:assignment_koder/utils/app_utils.dart';
import 'package:assignment_koder/utils/constants.dart';
import 'package:assignment_koder/widgets/toast.dart';
import 'package:get/get.dart';

class DashboardController  extends GetxController{
  AppUtils appUtils=AppUtils();
  ProductRepository productRepository =ProductRepository();
  RxBool isLoading =true.obs;
  List<ProductModel> products=[];

  @override
  void onInit()async{
    // Calling getProducts on controller initiation
    await getProducts();
    super.onInit();
  }

  Future<void> getProducts()async{
    isLoading(true);
    try{
      // API method call from repository
    products=await productRepository.getProducts();
    update();
    }catch(e,stack){
      showErrorToast(ErrorMessages.networkGeneral);
    }
    isLoading(false);
  }
}