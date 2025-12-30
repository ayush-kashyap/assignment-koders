import 'package:assignment_koder/model/product_model.dart';
import 'package:get/get.dart';

class ProductViewController extends GetxController{
  // Getting product data from arguments passed via Get.toNamed
  ProductModel product =Get.arguments??ProductModel();

}