import 'package:get/get.dart';
import 'package:pharmacies/view/screens/auth/login_screen.dart';
import 'package:pharmacies/view/screens/auth/signup_screen.dart';
import 'package:pharmacies/view/screens/welcome_screen.dart';

class AppRoutes {
  //initialRoute

  static const welcome = Routes.welcomeScreen;
  static const mainSreen = Routes.mainScreen;
  //getPages

  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    ,
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const mainScreen = '/mainScreen';
}
