import 'package:camionesm/app/pages/nav/home/home.controller.dart';
import 'package:camionesm/app/pages/nav/home/home_filter.controller.dart';
import 'package:camionesm/app/pages/nav/home/widgets/app_bar_profile.widget.dart';
import 'package:camionesm/app/pages/nav/home/widgets/card_filter.widget.dart';
import 'package:camionesm/app/pages/nav/home/widgets/transport_item.dart';
import 'package:camionesm/app/utils/dialog.utils.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/buttons/button_card.widget.dart';
import 'package:camionesm/app/widgets/buttons/chip.widget.dart';
import 'package:camionesm/app/widgets/buttons/icon_button.widget.dart';
import 'package:camionesm/app/widgets/images_assets.widget.dart';
import 'package:camionesm/app/widgets/progess_bar.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        floatingActionButton: _customFloatingButton(),
        body: Visibility(
                  visible: !controller.loading(),
                  replacement: const CustomProgressBar(),
                  child: Stack(
                      children: [
                        AnimatedCrossFade(
                            duration: const Duration(milliseconds: 400),
                          crossFadeState: controller.isHomeView()? CrossFadeState.showFirst :CrossFadeState.showSecond,
                            firstChild: _frameHome(context),
                            secondChild: _frameMap()),
                      const Padding(
                        padding: EdgeInsets.only(top: 115),
                        child: HomeCardFilter())
                      ]))));
  }

  //region frames
  Widget _frameHome(BuildContext context){
    return Column(
        children: [
          AppBarProfile(
              backgroundColor: Globals.principalColor,
              enableNotification: controller.enableNotification(),
              name: "Jorge M."),
          SizedBox(height: Get.height*0.07),
          _filterChips(context),
          _listItems(context)
        ]);
  }
  Widget _frameMap() {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: FlutterMap(
          mapController: controller.mapController(),
          options: const MapOptions(initialCenter: Globals.locationMX, minZoom: 5, maxZoom: 16),
          children: [
            TileLayer(urlTemplate: Globals.templateURL),
            MarkerClusterLayerWidget(options:
            MarkerClusterLayerOptions(
                maxClusterRadius: 120,
                size: const Size(40, 40),
                polygonOptions: const PolygonOptions(
                borderColor: Colors.blueAccent,
                color: Colors.black12,
                borderStrokeWidth: 3),
                markers: HomeController.points.map((point) =>
                  Marker(
                      width: 40,
                      height: 40,
                      point: point,
                      child: GestureDetector(
                        onTap: ()=> _frameItemSelect(point),
                        child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: CustomImageAssets(url: Paths.box,height: Get.height*0.12,width: Get.width*0.25,fit: BoxFit.fill)),
                      ))).toList(),
                builder: (context, markers) =>
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue),
                        child: Center(
                            child: Text(
                                markers.length.toString(),
                                style: const TextStyle(color: Colors.white))))))
          ]));
  }
  Future<bool>  _frameFilter(BuildContext context) {
    var titleSmall=Theme.of(context).textTheme.titleSmall!.apply(fontWeightDelta: FontWeight.w100.index, fontSizeDelta: 4);
    var titleSmallDisable=Theme.of(context).textTheme.titleSmall!.apply(color: Theme.of(context).disabledColor, fontWeightDelta: FontWeight.w100.index, fontSizeDelta: 4);
    return DialogUtils.screen(
      child: Scrollbar(child: SingleChildScrollView(child: Column(children: [
        Align(alignment: Alignment.centerLeft, child: CustomText("Aplicar filtros", style: Theme.of(context).textTheme.titleLarge)),
        Align(alignment: Alignment.centerLeft, child: CustomText("Los filtros nos ayudarán a encontrar las mejores opciones para tí.", style: titleSmallDisable )),
        SizedBox(height: Get.height*0.02),

        Align(alignment: Alignment.centerLeft, child: CustomText("Por origen", style:titleSmall)),
        SizedBox(height: Get.height*0.02),
        _customGridView(context,Keys.stateOrigin),
        SizedBox(height: Get.height*0.02),
        Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                  height: Get.height * 0.05,
                  width: Get.width * 0.4,
                  child: CustomButton(
                      title: "Ver Mas",
                      height: Get.height * 0.02,
                      width: Get.width * 0.4,
                      color: Colors.black,
                      onPressed: () =>Get.back(result: true)))),
          SizedBox(height: Get.height*0.02),

          Align(alignment: Alignment.centerLeft, child: CustomText("Destino", style:titleSmall)),
          SizedBox(height: Get.height*0.02),
          _customGridView(context,Keys.stateDestiny),
          SizedBox(height: Get.height*0.02),
          Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                  height: Get.height * 0.05,
                  width: Get.width * 0.4,
                  child: CustomButton(
                      title: "Ver Mas",
                      height: Get.height * 0.02,
                      width: Get.width * 0.4,
                      color: Colors.black,
                      onPressed: () =>Get.back(result: true)))),
          SizedBox(height: Get.height*0.02),

          CustomCardButton(
              backgroundColor: Colors.white,
              borderColor: Globals.secondColor,
              radius: 20,
              children: [
                SizedBox(
                  height: Get.height*0.06,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText("Por fecha de envío",style: titleSmall ),
                        const CustomIconButton(icon: Icons.calendar_month_outlined, backgroundColor: Colors.black)
                      ]).paddingAll(5),
                )
              ]),
          SizedBox(height: Get.height*0.02),

          Align(alignment: Alignment.centerLeft, child: CustomText("Tipo de producto", style:titleSmall)),
          SizedBox(height: Get.height*0.02),
          GridView.builder(
              shrinkWrap: true,
              itemCount: HomeFilterController.typeProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 40),
              primary: false,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) =>
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(value: false, onChanged: (d){}),
                        Expanded(child: CustomText(HomeFilterController.typeProducts[index],maxLines: 1, style: Theme.of(context).textTheme.titleMedium))
                      ]))
        ]))));
  }
  Future<bool>  _frameItemSelect(LatLng point) {
    return DialogUtils.screen(
        height: 0.69,
        alignment: Alignment.center,
        backgroundColor: Colors.transparent,
        child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: const [
                CustomTransportItem(),
                CustomTransportItem(),
                CustomTransportItem()
              ])
        );
  }
  //endregion

  //region widgets
  Widget _filterChips(BuildContext context) {
    return SizedBox(
        height: Get.height*0.05,
        width: Get.width,
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(width: Get.width*0.05),
              SizedBox(
                  width: Get.width*0.11,
                  child: CustomIconButton(icon: Icons.ice_skating,
                      onPressed: ()=>_frameFilter(context),
                      iconWidget: Image.asset(Paths.filterList,height: Get.height*0.1,width: Get.width*0.05),
                      backgroundColor: Globals.principalColor)),
              ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: HomeFilterController.labelsFilters.map((e) => CustomChips(label: e,paddingAll: 9).paddingOnly(left: 5,right: 5)).toList())
            ]));
  }
  Widget _customGridView(BuildContext context, String state) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: HomeFilterController.labelsFilters.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 20,
            crossAxisSpacing: 35,
            mainAxisExtent: 35),
        primary: false,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) =>
            CustomChips(
                label: HomeFilterController.labelsFilters[index],
                paddingAll: 5,
                onPressed: () => controller.onLabelChange(HomeFilterController.labelsFilters[index],state),
                color: Colors.white,
                leading: const Icon(Icons.add, color: Colors.black)));
  }
  Widget _customFloatingButton(){
    return SizedBox(
        height: Get.height*0.075,
        width: Get.width*0.165,
        child:  CustomIconButton(
            onPressed: ()=>controller.isHomeView(!controller.isHomeView()),
            icon: controller.isHomeView()? Icons.map_outlined:Icons.arrow_back_rounded,
            size: 32,
            backgroundColor: controller.isHomeView()?Colors.black:Colors.white));
  }
  Widget _listItems(BuildContext context){
    return SizedBox(
        height: Get.height*0.6295,
        child: ListView(
            physics: const BouncingScrollPhysics(),
            children: ListTile.divideTiles(
                context: context,
                color: Colors.black12,
                tiles: [
                  const CustomTransportItem(),
                  const CustomTransportItem()
                ]).toList()
        ).paddingAll(10));
  }
  //endregion

}