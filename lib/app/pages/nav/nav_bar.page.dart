import 'package:camionesm/app/pages/nav/nav_bar.controller.dart';
import 'package:camionesm/app/widgets/notification.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBarPage extends GetView<NavBarController>{
  const NavBarPage({super.key});


  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) => controller.onItemTapped(0),
      child: Obx(()=>Scaffold(
        body: PageView(
          onPageChanged: (value) => controller.onItemTapped(value),
            controller: controller.pageController(),
            children: NavBarController.navItems.map((e) => e.page).toList()),
        bottomNavigationBar: _customNavBar(context))));
  }

  Widget _customNavBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: controller.selectedItem(),
      onTap: (index) => controller.onItemTapped(index),
      items: NavBarController.navItems.map((e) =>
          BottomNavigationBarItem(
              label: e.label,
              icon:  CustomNotification(
                  haveNotification: e.haveNotification,
                  child: Icon(e.icon, size: 25)))).toList());
  }
}