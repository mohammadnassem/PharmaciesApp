import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/theme.dart';
import '../../view/widgets/text_utils.dart';
import '../../logic/controllers/splash_conroller.dart';
import '../../view/screens/main_screen.dart';
import 'package:page_transition/page_transition.dart';
import '../../view/screens/welcome_screen.dart';

class SplashScreen extends StatelessWidget {
  SplashController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      initState: (_) {},
      builder: (_) {
        return Scaffold(
            body: AnimatedSplashScreen(
          splash: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/icon.png",
                  fit: BoxFit.contain,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    TextUtils(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      text: 'Pharmacy',
                      color: mainColor,
                      underLine: TextDecoration.none,
                    ),
                    TextUtils(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      text: ' App',
                      color: Colors.black,
                      underLine: TextDecoration.none,
                    ),
                  ],
                ),
              ],
            ),
          ),
          nextScreen: controller.validityToken == true
              ? const MainScreen()
              : const WelcomeScreen(),
          backgroundColor: whitecolor,
          splashIconSize: 250,
          duration: 4000,
          animationDuration: const Duration(seconds: 3),
          splashTransition: SplashTransition.scaleTransition,
          pageTransitionType: PageTransitionType.rightToLeftWithFade,
        ));
      },
    );
  }
}
