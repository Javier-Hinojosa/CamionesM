import 'package:camionesm/app/pages/detail/petition/categories/detail_petition_approve.page.dart';
import 'package:camionesm/app/pages/detail/petition/categories/detail_petition_receive.page.dart';
import 'package:camionesm/app/pages/detail/petition/categories/detail_petition_send.page.dart';
import 'package:camionesm/app/pages/detail/petition/contract/detail_petition.contract.dart';
import 'package:camionesm/app/pages/detail/petition/detail_petition.controller.dart';
import 'package:camionesm/app/widgets/app_bar/app_bar.widget.dart';
import 'package:camionesm/app/widgets/containers/container.widget.dart';
import 'package:camionesm/app/widgets/containers/container_outline.widget.dart';
import 'package:camionesm/app/widgets/images/image_assets.widget.dart';
import 'package:camionesm/app/widgets/images/image_circle.widget.dart';
import 'package:camionesm/app/widgets/map.widget.dart';
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
                                  child: Visibility(
                                      visible: controller.petitionsList()!=TypePetition.approves,
                                      replacement: _customCardMap(context),
                                      child: const CustomImageAssets(url:Paths.papers))),
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
              width: Get.width*0.19,
              height: Get.height*0.04,
              child: Card(
                  color: Colors.black,
                  child: Icon(icon,color: Colors.white,size: 24))),
          SizedBox(width: Get.width*0.02),
          CustomText(title,style: titleSmall.apply(fontWeightDelta: FontWeight.w300.value))
        ]);
 }
  Widget _customCardMap(BuildContext context) {
    return SizedBox(
        height: Get.height * 0.25,
        width: Get.width,
        child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            clipBehavior: Clip.antiAlias,
            child: CustomFlutterMap(controller.mapController(), haveIntermediary: false)));
  }
//endregion

//region public
  Widget cardUser(BuildContext context){
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CircleAvatar(
                    radius: 25.0,
                    backgroundImage: AssetImage(Paths.profile2)),
                SizedBox(width: Get.width * 0.03),
                SizedBox(
                    width: Get.width * 0.5,
                    height: Get.height * 0.07,
                    child: CustomContainer(
                        backgroundColor: Globals.principalColor,
                        radius: 30,
                        child:  Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText("  Carlos Fuentes",style: TextStyle(fontWeight: FontWeight.bold)),
                              DetailPetitionContract.customTextRow(context, "", " ID CID0101874", mainAxisAlignment: MainAxisAlignment.start)
                            ])))
              ]),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.star_rate_rounded,
                    color: Colors.black, size: 24),
                SizedBox(width: Get.width * 0.01),
                CustomText("4.2",
                    style: titleMedium.apply(
                        fontWeightDelta: FontWeight.bold.value))
              ])
        ]);
  }
  Widget rowText(BuildContext context, String title, String content,{Color? color, MainAxisAlignment mainAxisAlignment=MainAxisAlignment.spaceBetween}){
    return  Row(
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomText(title,maxLines: 1, style: titleSmall.apply(color: color, fontWeightDelta: FontWeight.w400.index)),
          Flexible(child: CustomText(content,maxLines: 1,style: titleSmall.apply(color: color)))
        ]);
  }
  Widget cardEarnings(){
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText("Ganancia",
              style: titleMedium.apply(
                  fontWeightDelta: FontWeight.w300.index)),
          CustomText("\$4,300 MXN",
              style: titleMedium.apply(
                  fontSizeDelta: 14,
                  fontWeightDelta: FontWeight.w300.index))
        ]);
  }
  Widget cardDate(){
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
      Row(children: [
        const CircleAvatar(
            radius: 15,
            backgroundColor: Colors.black12,
            child:
            Icon(Icons.calendar_month_outlined, color: Colors.black)),
        SizedBox(width: Get.width * 0.03),
        CustomText("Fecha de envío", style: titleMedium)
      ]),
      const CustomText("03/04/24")
    ]);
  }
  Widget cardPointDirections(){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ListTile(
              contentPadding: EdgeInsets.all(0),
              minVerticalPadding: 0,
              leading: CircleAvatar(
                  backgroundColor: Globals.principalColor,
                  child: Icon(Icons.location_on_outlined, color: Colors.black, size: 40.0)),
              title: CustomText("Recolección", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
              subtitle: CustomText(
                  """Calle Pitágoras 526,\nColonia: Narvarte Poniente\nC.P: 03020\nCDMX, México.              03/04/24   12:00 hrs""",
                  maxLines: 6,
                  style: TextStyle(fontWeight: FontWeight.w800))),
          SizedBox(height: Get.height*0.02),
          const ListTile(
              contentPadding: EdgeInsets.all(0),
              minVerticalPadding: 0,
              visualDensity: VisualDensity.compact,
              dense: false,
              leading: CircleAvatar(
                  backgroundColor: Globals.principalColor,
                  child: Icon(Icons.location_on,
                      color: Colors.black, size: 40.0)),
              title: CustomText("Entrega",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400)),
              subtitle: CustomText(
                  """Calle Pitágoras 526,\nColonia: Narvarte Poniente\nC.P: 03020\nCDMX, México.              03/04/24   12:00 hrs""",
                  maxLines: 6,
                  style: TextStyle(fontWeight: FontWeight.w800)))
        ]);
  }
  Widget cardMap(BuildContext context) {
    return SizedBox(
        height: Get.height * 0.13,
        width: Get.width,
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            clipBehavior: Clip.antiAlias,
            child: CustomFlutterMap(controller.mapController(), haveIntermediary: false)));
  }
  Widget cardDriver(BuildContext context){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        CustomText("Tu conductor",style: bodyMedium),
          SizedBox(height: Get.height*0.01),
          CustomContainerOutline(
              contentPadding: 10,
              radius: 15,
              children: [
            Row(
              children: [
                CustomImageCircle(url: Paths.profile3,
                    height: Get.height,
                    borderWidth: 2,
                    paddingAll: 0,
                    radius: 28),
                SizedBox(width: Get.width*0.05),
                Column(
                  crossAxisAlignment:  CrossAxisAlignment.start,
                  children: [
                    const CustomText("Jorge Martinez L",style: TextStyle(fontWeight: FontWeight.bold)),
                    DetailPetitionContract.customTextRow(context,"ID" , "CNJ010874",fontSizeDeltaTitle: -4,fontSizeSubtitle: 16),
                  ],
                )
              ])
          ])
      ]
    );
  }
  Widget cardTruck(BuildContext context){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText("Tu Transporte",style: bodyMedium),
          SizedBox(height: Get.height*0.01),
          CustomContainerOutline(
              contentPadding: 10,
              radius: 15,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(Paths.truck2,
                              width: Get.width*0.25,
                              height: Get.height*0.07,
                              fit: BoxFit.cover)),
                      SizedBox(width: Get.width*0.05),
                      Flexible(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomText(
                                    "C2 Camion Unitario (2 llantas en el eje delantero y 4 llantas en el eje trasero)",
                                    maxLines: 1,
                                    style: TextStyle(fontWeight: FontWeight.w800)),
                                rowText(context, "ID ", "TR010874",mainAxisAlignment: MainAxisAlignment.start)
                              ]))
                    ])
              ])
        ]
    );
  }

//endregion

}
