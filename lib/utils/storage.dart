import 'package:assignment_koder/utils/network_requester.dart';
import 'package:get_storage/get_storage.dart';

class Storage {

  static String? get token => box?.read("token");
  static set token(String? value) => box?.write("token", value);

  Storage._privateConstructor();

  static GetStorage? box;

  static Future<bool> init() async {
    final result = await GetStorage.init();
    box = GetStorage();
    return result;
  }

  static clear() {

    box?.erase();
    NetworkRequester.shared.prepareRequest();
  }
}
