

import 'package:flutter/material.dart';
import 'package:freelancerApp/core/resources/app_colors.dart';
import 'package:freelancerApp/core/widgets/bottom_navber.dart';

import 'package:get/get.dart';

import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  RootView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(RootController());
    return Obx(
      () => Scaffold(
        key: scaffoldKey,
       // drawer: const CustomDrawer(),
        extendBody: true,
       // backgroundColor: AppColors.primaryLightColor,
        bottomNavigationBar:
            buildBottomNavigationMenu(context, controller,
            0
            ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: controller
            .page[controller.selectedIndex.value],
      ),
    );
  }
}
