import 'package:get/get.dart';
import 'package:pharmacies/logic/controllers/splash_conroller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
