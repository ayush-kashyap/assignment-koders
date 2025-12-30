import 'package:assignment_koder/model/login_model.dart';
import 'package:assignment_koder/utils/constants.dart';
import 'package:assignment_koder/utils/network_requester.dart';

class UserRepository {
  Future<LoginModel> loginUser(Map<String,dynamic> data)async{
    // API call
    dynamic response=await NetworkRequester.shared.post(path: ApiPaths.login,data: data);
    // converting the received response in a LoginModel
    return response!=null? LoginModel.fromJson(response):LoginModel();

  }
}