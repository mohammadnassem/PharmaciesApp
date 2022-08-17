import 'package:flutter/material.dart';
import '../../view/screens/drawerScreen.dart';
import '../../view/screens/home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [const DrawerScreen(), HomeScreen()],
      ),
    );
  }
}
