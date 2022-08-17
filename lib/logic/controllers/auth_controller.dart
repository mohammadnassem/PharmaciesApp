import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pharmacies/local_save/sceure_storage.dart';
import 'package:pharmacies/model/user.dart';
import 'package:pharmacies/routes/routes.dart';
import 'package:pharmacies/services/auth_service.dart';
import 'package:pharmacies/utils/api_statues.dart';
import 'package:pharmacies/utils/task_error.dart';

class AuthController extends GetxController {
  bool isVisibilty = false;
  bool isCheckBox = false;
  User? _selecteduser;
  String? _token;
  DateTime? _expeiryDate;
  late SceureStorage _storage;

  @override
  void onInit() {
    _selecteduser = User();
    _storage = SceureStorage();
    super.onInit();
  }

  User? get selecteduser => _selecteduser;

  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_expeiryDate != null &&
        _expeiryDate!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  void visibility() {
    isVisibilty = !isVisibilty;

    update();
  }

  void checkBox() {
    isCheckBox = !isCheckBox;

    update();
  }

  setUserModel(User userModel) async {
    _selecteduser = userModel;
    _token = selecteduser?.token ?? await _storage.read("token");

    if (_selecteduser?.expiresIn != null) {
      _expeiryDate = DateTime.now().add(
        Duration(
          seconds:
              int.tryParse(_selecteduser?.expiresIn.toString() ?? '0') ?? 0,
        ),
      );

      await _storage.save('expiry', _expeiryDate.toString());
    } else {
      var exp = await _storage.read("expiry");
      _expeiryDate = exp != null ? DateTime.parse(exp) : null;
    }
    print(_expeiryDate);
  }

  login(User user) async {
    var response = await AuthService.signin(user);
    if (response is Success) {
      setUserModel(response.response as User);
      EasyLoading.showSuccess("Login Success");
      Get.offNamed(Routes.mainScreen);
    }
    if (response is Failure) {
      EasyLoading.dismiss();
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

  register(User user) async {
    var response = await AuthService.signup(user);
    if (response is Success) {
      setUserModel(response.response as User);
      EasyLoading.showSuccess("Register Success");
      Get.offNamed(Routes.mainScreen);
    }
    if (response is Failure) {
      EasyLoading.dismiss();
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

  signOutFromApp() async {
    await _storage.remove("token");
    await _storage.remove('expiry');
    Get.offNamed(Routes.welcomeScreen);
  }
}
