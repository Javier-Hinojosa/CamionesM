import 'package:camionesm/app/pages/detail/trips/categorys/detail_trip_active.page.dart';
import 'package:camionesm/app/pages/detail/trips/categorys/detail_trip_historical.page.dart';
import 'package:camionesm/app/pages/detail/trips/categorys/detail_trip_in_progress.page.dart';
import 'package:camionesm/app/pages/detail/trips/detail_trips.controller.dart';
import 'package:camionesm/app/widgets/app_bar/app_bar.widget.dart';
import 'package:camionesm/app/widgets/buttons/icon_button.widget.dart';
import 'package:camionesm/app/widgets/containers/container.widget.dart';
import 'package:camionesm/app/widgets/map.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/enums.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailTripsPage extends GetView<DetailTripsController> {
  const DetailTripsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(leadingColor: Colors.white),
    body: CustomScrollView(
      slivers: [
        _header(context),
        SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
                delegate: SliverChildListDelegate([_dynamicPage(context)])))
      ]));
  }
//region privates
  Widget _customCardMap(BuildContext context) {
    return SizedBox(
        height: Get.height * 0.25,
        width: Get.width,
        child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            clipBehavior: Clip.antiAlias,
            child: CustomFlutterMap(controller.mapController(), haveIntermediary: true)));
  }
  Widget _dynamicPage(BuildContext context){
    switch(controller.tripsList()){
      case TripsList.actives: return const DetailTripActivePage();
      case TripsList.inProgress: return const DetailTripInProgressPage();
      case TripsList.historical: return const DetailTripHistoricalPage();
    }
  }
  Widget _dynamicContainerId(BuildContext context,TripsList tripsList){
    switch(tripsList){
      case TripsList.actives: return rowText(context,"ID ","TR01284");
      case TripsList.inProgress: return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [ CustomText("Viaje en curso",style: titleSmall.apply(color: Colors.white)), rowText(context,"ID ","TR01284",color: Colors.white38) ]);
      case TripsList.historical: return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [ CustomText("Historial",style: titleSmall.apply(color: Colors.white)), rowText(context,"ID ","TR01284",color: Colors.white38) ]);
    }
  }
  SliverToBoxAdapter _header(BuildContext context){
    return SliverToBoxAdapter(
        child: Obx(()=>
            Stack(children: [
                  Column(
                      children: [
                        _customCardMap(context),
                        SizedBox(height: Get.height*0.04)
                      ]),
                  Positioned(
                      bottom: 0,
                      width: Get.width,
                      child: CustomContainer.circularTop(
                          elevation: 0,
                          backgroundColor: controller.tripsList()==TripsList.actives?null:Colors.black87,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                    children: [
                                      SizedBox(
                                          width: Get.width*0.18,
                                          child: Card(
                                              color: Globals.principalColor,
                                              child: Icon(controller.getIcon(),color: Colors.black,size: 28))),
                                      SizedBox(width: Get.width*0.02),
                                      _dynamicContainerId(context,controller.tripsList())
                                    ]),
                                SizedBox(
                                    width: Get.width*.11,
                                    height: Get.height*0.055,
                                    child: CustomIconButton(
                                        icon: Icons.share_outlined,
                                        backgroundColor: controller.tripsList()==TripsList.actives?Colors.black:Globals.principalColor,
                                        onPressed: (){}))
                              ]).paddingOnly(left: 10,right: 10)))
                ])));
}
//endregion

//region public
  Widget rowText(BuildContext context, String title, String content,{Color? color}){
    return  Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(title,maxLines: 1, style: titleSmall.apply(color: color, fontWeightDelta: FontWeight.w400.index)),
          Flexible(child: CustomText(content,maxLines: 1,style: titleSmall.apply(color: color)))
        ]);
  }
  Widget targetUser(BuildContext context){
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(Paths.profile2,
                            width: Get.width*0.1,
                            fit: BoxFit.cover)),
                    SizedBox(width:  Get.width*0.02),
                    Flexible(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(
                                  "Jorge Martinez L",
                                  maxLines: 1,
                                  style: TextStyle(fontWeight: FontWeight.w800)),
                              rowText(context, "ID ", "CN0110874",color: Theme.of(context).disabledColor)
                            ]))
                  ])),
          Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomText("\$4,300 MXN",style: titleLarge.apply(fontSizeDelta: -7)),
                CustomText("120 km",style: bodyMedium)
              ])
        ]);
  }
  Widget targetLocations(BuildContext context,{Color? backgroundIconColor}){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           ListTile(
              contentPadding: const EdgeInsets.all(0),
              minVerticalPadding: 0,
              leading:  CircleAvatar(
                  backgroundColor: backgroundIconColor??Globals.principalColor,
                  child: const Icon(Icons.location_on_outlined,
                      color: Colors.black, size: 36.0)),
              title: CustomText("Salida", style: TextStyle(
                  color: Theme.of(context).disabledColor,
                  fontSize: 18, fontWeight: FontWeight.w400)),
              subtitle: const CustomText(
                  "Calle Pitágoras 526,  Narvarte Ponie... 03020CDMX, México.    03/04/24   12:00 hrs",
                  maxLines: 4,
                  style: TextStyle(fontWeight: FontWeight.w800))),
          SizedBox(height: Get.height * 0.02),
           ListTile(
              contentPadding: const EdgeInsets.all(0),
              minVerticalPadding: 0,
              leading:  CircleAvatar(
                  backgroundColor: backgroundIconColor??Globals.principalColor,
                  child: const Icon(Icons.location_on,
                      color: Colors.black, size: 36.0)),
              title: CustomText("Llegada",
                  style: TextStyle(
                      color: Theme.of(context).disabledColor,
                      fontSize: 18, fontWeight: FontWeight.w400)),
              subtitle: const CustomText(
                  "Calle Pitágoras 526,  Narvarte Ponie... 03020CDMX, México.    03/04/24   12:00 hrs",
                  maxLines: 4,
                  style: TextStyle(fontWeight: FontWeight.w800)))
        ]);
  }
//endregion
}