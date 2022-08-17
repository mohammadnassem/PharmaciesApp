import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacies/local_save/sceure_storage.dart';
import 'package:pharmacies/logic/controllers/auth_controller.dart';
import 'package:pharmacies/model/user.dart';
import 'package:pharmacies/routes/routes.dart';
import 'package:pharmacies/services/auth_service.dart';
import 'package:pharmacies/utils/api_statues.dart';
import 'package:pharmacies/utils/task_error.dart';

class SplashController extends GetxController {
  late SceureStorage _storage;
  late bool validityToken;
  late AuthController controller;

  @override
  void onInit() async {
    validityToken = false;
    _storage = SceureStorage();
    await checkToken();
    super.onInit();
  }

  Future<void> checkToken() async {
    String? token = await _storage.read('token');

    if (token != null) {
      await validToken(token);
    }
    update();
  }

  Future<void> validToken(String token) async {
    var response = await AuthService.validToken(token);
    if (response is Success) {
      validityToken = true;
      controller = Get.put(AuthController(), permanent: true);
      controller.setUserModel(response.response as User);
    }
    if (response is Failure) {
      validityToken = false;
      UserError userError = UserError(
        code: response.code,
        message: response.errorResponse.toString(),
      );
      Get.snackbar(
        "Error:",
        userError.message!,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
