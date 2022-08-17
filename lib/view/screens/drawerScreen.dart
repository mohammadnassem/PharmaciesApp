import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../logic/controllers/auth_controller.dart';
import '../../utils/configuration.dart';
import '../../utils/theme.dart';
import '../widgets/text_utils.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryGreen,
      padding: const EdgeInsets.only(top: 50, bottom: 70, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetBuilder<AuthController>(
                    initState: (_) {},
                    builder: (_) {
                      return TextUtils(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        text: controller.selecteduser?.name ?? '',
                        color: whitecolor,
                        underLine: TextDecoration.none,
                      );
                    },
                  ),
                  const TextUtils(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    text: "Active Status",
                    color: whitecolor,
                    underLine: TextDecoration.none,
                  ),
                ],
              )
            ],
          ),
          Column(
            children: drawerItems
                .map((element) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            element['icon'],
                            color: Colors.white,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          TextUtils(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            text: element['title'],
                            color: whitecolor,
                            underLine: TextDecoration.none,
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Hero(
                tag: "logOut",
                child: InkWell(
                  onTap: () {
                    if (controller.isAuth) {
                      controller.signOutFromApp();
                    }
                  },
                  child: const TextUtils(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    text: "Log out",
                    color: whitecolor,
                    underLine: TextDecoration.none,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
