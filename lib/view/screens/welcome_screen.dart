import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacies/routes/routes.dart';
import 'package:pharmacies/utils/theme.dart';
import 'package:pharmacies/view/widgets/text_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/welcome.jpg',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.11,
                  ),
                  Container(
                    height: 60,
                    width: 190,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: TextUtils(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        text: 'Welcome',
                        color: Colors.white,
                        underLine: TextDecoration.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: 260,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextUtils(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          text: "Pharmacies",
                          color: mainColor,
                          underLine: TextDecoration.none,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        TextUtils(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          text: "App",
                          color: Colors.white,
                          underLine: TextDecoration.none,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.5,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 12,
                        )),
                    onPressed: () {
                      Get.offNamed(Routes.loginScreen);
                    },
                    child: TextUtils(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      text: 'Get Start',
                      color: Colors.white,
                      underLine: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        text: "Don't have an Account?",
                        color: Colors.black,
                        underLine: TextDecoration.none,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offNamed(Routes.signUpScreen);
                        },
                        child: TextUtils(
                          text: 'Sign Up',
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          underLine: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
