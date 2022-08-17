import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../logic/controllers/home_controller.dart';
import '../../utils/theme.dart';
import '../widgets/text_utils.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final controller = Get.put(HomeController());

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000))
      ..repeat(reverse: true);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.linearToEaseOut);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0)),
      child: GetBuilder<HomeController>(
        initState: (_) {},
        builder: (_) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      isDrawerOpen
                          ? IconButton(
                              icon: const Icon(Icons.arrow_back_ios),
                              onPressed: () {
                                setState(() {
                                  xOffset = 0;
                                  yOffset = 0;
                                  scaleFactor = 1;
                                  isDrawerOpen = false;
                                });
                              },
                            )
                          : IconButton(
                              icon: const Icon(Icons.menu),
                              onPressed: () {
                                setState(() {
                                  xOffset = 180;
                                  yOffset = 150;
                                  scaleFactor = 0.6;
                                  isDrawerOpen = true;
                                });
                              }),
                      Column(
                        children: [
                          const TextUtils(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            text: "Location",
                            color: mainColor,
                            underLine: TextDecoration.none,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: primaryGreen,
                              ),
                              TextUtils(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                text: controller.selectedPharmacy?.location
                                        .toString() ??
                                    '',
                                color: darkGreyClr,
                                underLine: TextDecoration.none,
                              )
                            ],
                          ),
                        ],
                      ),
                      const CircleAvatar()
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  margin:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.search),
                      TextUtils(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        text: "Search",
                        color: mainColor,
                        underLine: TextDecoration.none,
                      ),
                      Icon(Icons.settings)
                    ],
                  ),
                ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.pharmacyListModel.length,
                    itemBuilder: (context, index) {
                      return controller.selectedPharmacy?.id ==
                              controller.pharmacyListModel[index].id
                          ? pharmicy(index)
                          : pharmicy2(index);
                    },
                  ),
                ),
                ...List.generate(controller.productListModel.length, (index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 240,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey[300],
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: shadowList,
                                  ),
                                  margin: const EdgeInsets.only(top: 50),
                                ),
                                Align(
                                  child: Image.asset(controller
                                      .productListModel[index].photo
                                      .toString()),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                              child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextUtils(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    text: controller
                                        .productListModel[index].name
                                        .toString(),
                                    color: mainColor,
                                    underLine: TextDecoration.none,
                                  ),
                                  TextUtils(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    text: "count: " +
                                        controller.productListModel[index].count
                                            .toString(),
                                    color: mainColor,
                                    underLine: TextDecoration.none,
                                  ),
                                ],
                              ),
                            ),
                            margin: const EdgeInsets.only(top: 60, bottom: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: shadowList,
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                          ))
                        ],
                      ),
                    ),
                  );
                }),
                const SizedBox(
                  height: 550,
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Column pharmicy(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RotationTransition(
          turns: _animation,
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: shadowList,
                borderRadius: BorderRadius.circular(40)),
            child: GestureDetector(
              onTap: () {
                controller
                    .setSelectedPharmacye(controller.pharmacyListModel[index]);
              },
              child: Image.asset(
                controller.pharmacyListModel[index].photo.toString(),
                fit: BoxFit.contain,
                height: 50,
                width: 50,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(left: 20),
          child: TextUtils(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            text: controller.pharmacyListModel[index].name.toString(),
            color: darkGreyClr,
            underLine: TextDecoration.none,
          ),
        )
      ],
    );
  }

  Column pharmicy2(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: shadowList,
              borderRadius: BorderRadius.circular(60)),
          child: GestureDetector(
            onTap: () {
              controller
                  .setSelectedPharmacye(controller.pharmacyListModel[index]);
            },
            child: Image.asset(
              controller.pharmacyListModel[index].photo.toString(),
              height: 50,
              width: 50,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(left: 20),
          child: TextUtils(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            text: controller.pharmacyListModel[index].name.toString(),
            color: mainColor,
            underLine: TextDecoration.none,
          ),
        )
      ],
    );
  }
}
