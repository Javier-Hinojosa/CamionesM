import 'package:camionesm/app/pages/nav/items/home/home.page.dart';
import 'package:camionesm/app/pages/nav/items/petitions/petitions.page.dart';
import 'package:camionesm/app/pages/nav/items/settings/settings.page.dart';
import 'package:camionesm/app/pages/nav/items/trips/trips.page.dart';
import 'package:camionesm/app/pages/nav/items/truks/truks.page.dart';
import 'package:camionesm/core/values/enums.dart';
import 'package:camionesm/data/models/internal/nav_bar.item.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBarController extends GetxController{

  final selectedItem= 0.obs;
  Rx<PageController> pageController = PageController().obs;

  static final List<NavBarItem> navItems = [
    NavBarItem(NavBarItems.home,Icons.search,"Explorar",const HomePage()),
    NavBarItem(NavBarItems.petitions,Icons.notifications_none,"Solicitudes",const PetitionsPage()),
    NavBarItem(NavBarItems.trucks,Icons.local_shipping_outlined,"Camiones", TrucksPage()),
    NavBarItem(NavBarItems.trips,Icons.location_on_outlined,"Mis viajes",const TripsPage()),
    NavBarItem(NavBarItems.settings,Icons.menu,"Menú",const SettingsPage(),haveNotification: true)
  ];


  @override
  void onReady() async {
    super.onReady();
    pageController(PageController());
  }



  onItemTapped(int index) {
    selectedItem(index);
    pageController().animateToPage(index, duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
    if(selectedItem()==0){//onRefresh

    }
  }

  @override
  void onClose() {
    super.onClose();
    pageController().dispose();
  }

}