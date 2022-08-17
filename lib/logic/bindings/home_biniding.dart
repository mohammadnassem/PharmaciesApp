import 'package:get/instance_manager.dart';

import 'package:pharmacies/logic/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
