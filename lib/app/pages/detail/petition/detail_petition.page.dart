import 'package:camionesm/app/pages/detail/petition/categories/detail_petition_approve.page.dart';
import 'package:camionesm/app/pages/detail/petition/categories/detail_petition_receive.page.dart';
import 'package:camionesm/app/pages/detail/petition/categories/detail_petition_send.page.dart';
import 'package:camionesm/app/pages/detail/petition/detail_petition.controller.dart';
import 'package:camionesm/app/widgets/app_bar/app_bar.widget.dart';
import 'package:camionesm/app/widgets/containers/container.widget.dart';
import 'package:camionesm/app/widgets/images/image_assets.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/enums.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class DetailPetitionPage extends GetView<DetailPetitionController> {
  const DetailPetitionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(),
        body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: Obx(()=>
                      Stack(children: [
                        Column(
                            children: [
                              SizedBox(
                                  height: Get.height * 0.25,
                                  width: Get.width,
                                  child: const CustomImageAssets(url:Paths.papers)),
                              SizedBox(height: Get.height*0.04)
                            ]),
                        Positioned(
                            bottom: 0,
                            width: Get.width,
                            child: CustomContainer.circularTop(
                                elevation: 0,
                                backgroundColor: Globals.principalColor,
                                child: _dynamicRow().paddingOnly(left: 10,right: 10)))
                      ]))),
              SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverList(
                      delegate: SliverChildListDelegate([_dynamicPage(context)])))
            ]));
  }

//region privates
  Widget _dynamicPage(BuildContext context){
    switch(controller.petitionsList()){
      case TypePetition.receives: return const DetailPetitionReceivePage();
      case TypePetition.sends: return const DetailPetitionSendPage();
      case TypePetition.approves: return const DetailPetitionApprovePage();
    }
  }
  Widget _dynamicRow(){
    switch(controller.petitionsList()){
      case TypePetition.receives: return _rowTypePetition(Icons.mail_outline,"Recibidas");
      case TypePetition.sends: return _rowTypePetition(FontAwesomeIcons.paperPlane,"Enviadas");
      case TypePetition.approves: return _rowTypePetition(Icons.done_all_outlined,"Aprobadas");
    }
  }
  Widget _rowTypePetition( IconData icon, String title){
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              width: Get.width*0.18,
              child: Card(
                  color: Globals.principalColor,
                  child: Icon(icon,color: Colors.black,size: 28))),
          SizedBox(width: Get.width*0.02),
          CustomText(title,style: titleSmall.apply(color: Colors.white))
        ]);
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
