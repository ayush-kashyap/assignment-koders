import 'package:assignment_koder/model/product_model.dart';
import 'package:assignment_koder/utils/constants.dart';
import 'package:assignment_koder/utils/network_requester.dart';

class ProductRepository {
  Future<List<ProductModel>> getProducts()async{
    // Fetching API for product data
    dynamic response = await NetworkRequester.shared.get(path: ApiPaths.products);
    // converting the received response in a List of ProductModel ( products )
    return  List.generate(response?.length??0, (index)=>ProductModel.fromJson(response[index]));
  }
}