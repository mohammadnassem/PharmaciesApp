import 'package:get/get.dart';
import 'package:pharmacies/logic/bindings/auth_biniding.dart';
import 'package:pharmacies/logic/bindings/splash_binding.dart';
import 'package:pharmacies/view/screens/auth/login_screen.dart';
import 'package:pharmacies/view/screens/auth/signup_screen.dart';
import 'package:pharmacies/view/screens/main_screen.dart';
import 'package:pharmacies/view/screens/splash_screen.dart';
import 'package:pharmacies/view/screens/welcome_screen.dart';

class AppRoutes {
  //initialRoute

  static const welcome = Routes.welcomeScreen;
  static const splashScreen = Routes.splashScreen;
  //getPages

  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => const MainScreen(),
    ),
    GetPage(
      name: Routes.splashScreen,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const mainScreen = '/mainScreen';
  static const splashScreen = '/SplashScreen';
}
