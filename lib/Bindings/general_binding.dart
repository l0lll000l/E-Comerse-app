import 'package:flutter_application_1/Utils/Helpers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBingdings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
