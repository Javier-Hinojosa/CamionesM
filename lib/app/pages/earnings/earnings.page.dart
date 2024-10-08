import 'package:camionesm/app/pages/earnings/eanings.controller.dart';
import 'package:camionesm/app/pages/nav/Widgets/simple_title_card.widget.dart';
import 'package:camionesm/app/widgets/app_bar/app_bar.widget.dart';
import 'package:camionesm/app/widgets/buttons/chip.widget.dart';
import 'package:camionesm/app/widgets/buttons/icon_button.widget.dart';
import 'package:camionesm/app/widgets/containers/container.widget.dart';
import 'package:camionesm/app/widgets/containers/container_outline.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EarningsPage extends GetView<EarningsController>{
  const EarningsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(backgroundColor: Globals.principalColor),
      body: Scrollbar(child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _simpleCardTop(),
            SizedBox(height: Get.height*0.01),
            _cardTrips(),
            SizedBox(height: Get.height*0.03),
            _customCardEarningsGlobals(),
            SizedBox(height: Get.height*0.02),
            _customCardEarningsMonthly(),
            SizedBox(height: Get.height*0.02),
            CustomText("Generar reporte", style: titleLarge.apply(fontSizeDelta: -5)),
            SizedBox(height: Get.height*0.02),
            _customChipsPeriodic(),
            SizedBox(height: Get.height*0.02),
            _customChart(),
            SizedBox(height: Get.height*0.02),
            _simpleCardBottom(),
            SizedBox(height: Get.height*0.02),
          ]).paddingAll(15))));
  }

  Widget _simpleCardTop(){
    return const SimpleTitleCard(
        CircleAvatar(
            backgroundColor:Colors.white,
            child: Icon(Icons.payments_outlined)),
        "Mis ganancias");
  }
 Widget _simpleCardBottom(){
    return CustomContainer(
        backgroundColor: Colors.transparent,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText("Descarga reporte",
                  maxLines: 1,
                  style:
                  bodyMedium.apply(fontWeightDelta: FontWeight.bold.value)),
              CustomIconButton(
                  width: Get.width*0.14,
                  size: 28,
                  backgroundColor: Globals.principalColor,
                  icon: Icons.sim_card_download_outlined)
            ]).paddingOnly(left: 10, right: 10)
    ).paddingOnly(top: 10, bottom: 10);
  }
  Widget _cardTrips(){
    return CustomContainerOutline(
        radius: 18,
        contentPadding: 10,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText("Viajes Totales", style: titleLarge.apply(fontSizeDelta: -5)),
                      CustomText("Viajes completados",style: titleSmall)
                    ]),
                Flexible(child: CustomText("114", style: titleLarge))
              ]).paddingOnly(left: 10,right: 10)
        ]);
  }
  Widget _customCardEarningsGlobals(){
    return CustomContainer(
        radius: 18,
        contentPadding: 20,
        backgroundColor: Globals.principalColor,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomText("Ingreso Global", style: titleLarge.apply(fontSizeDelta: -5)),
                    CustomContainer(
                        elevation: 0,
                        backgroundColor: Colors.black,
                        width: Get.width*0.2,
                        child: Row(
                            children: [
                              const Icon(Icons.moving,color: Colors.white),
                              CustomText(" + 11.4%",style: titleSmall.apply(color:Colors.white))
                            ]))
                  ]),
              SizedBox(height: Get.height*0.04),
              CustomText("\$ 410,000.00", style: titleLarge),
              SizedBox(height: Get.height*0.02),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText("Balance total en MXN",style: titleSmall),
                    CustomIconButton(
                        width: Get.width*0.14,
                        backgroundColor: Colors.black,
                        size: 30,
                        icon: Icons.keyboard_arrow_down_outlined)
                  ])
            ]));

  }
  Widget _customCardEarningsMonthly(){
    return CustomContainer(
        radius: 18,
        contentPadding: 20,
        backgroundColor: Colors.black,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomText("Ingreso Mensual", style: titleLarge.apply(color: Colors.white, fontSizeDelta: -5)),
                    CustomContainer(
                        elevation: 0,
                        backgroundColor: Globals.principalColor,
                        width: Get.width*0.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Icon(Icons.moving,color: Colors.black),
                              CustomText(" + 6.3%",style: titleSmall.apply())
                            ]))
                  ]),
              SizedBox(height: Get.height*0.04),
              CustomText("\$ 28,314.50", style: titleLarge.apply(color: Colors.white)),
              SizedBox(height: Get.height*0.02),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText("Balance total en MXN",style: titleSmall.apply(color: Colors.white)),
                    CustomIconButton(
                        width: Get.width*0.14,
                        backgroundColor: Globals.principalColor,
                        size: 30,
                        icon: Icons.keyboard_arrow_down_outlined)
                  ])
            ]));

  }
  Widget _customChipsPeriodic(){
    return SizedBox(
        height: Get.height*0.048,
        width: Get.width,
        child: Obx(()=>
            ListView(
                scrollDirection: Axis.horizontal,
                children: controller.typeListTrips.map((e) =>
                    CustomChip(label: e.title,
                        labelColor: e.isSelect?null:Colors.white,
                        backgroundColor:  e.isSelect?null:Colors.black87,
                        onPressed: ()=>controller.onChangeListType(e)).paddingOnly(right: 10)).toList())));
  }
  Widget _customChart(){
    return  CustomContainer(
      height: Get.height*0.3,
      backgroundColor: Colors.black,
      radius: 30,
      contentPadding: 40,
      child: BarChart(
        BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 40,
            barTouchData: BarTouchData(enabled: false),
            titlesData: FlTitlesData(
                leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) =>
                    CustomText('${value.toInt()} mil', style: const TextStyle(color: Colors.white)),
                reservedSize: 40)),
                bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 0:return const Text('Abr', style: TextStyle(color: Colors.white));
                            case 1:return const Text('May', style: TextStyle(color: Colors.white));
                            case 2:return const Text('Jun', style: TextStyle(color: Colors.white));
                            default:return const Text('');
                          }
                        })),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false))),
            gridData: const FlGridData(show: false),
            borderData: FlBorderData(show: false),
            barGroups: [
              BarChartGroupData(
              x: 0,
              barRods: [
                BarChartRodData(
                  toY: 15,
                  width: 70,
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    colors: [Colors.yellow.withOpacity(0.4), Colors.yellow],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter))
              ]),
              BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(
                  toY: 30,
                  width: 70,
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    colors: [Colors.yellow.withOpacity(0.4), Colors.yellow],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter))
              ]),
              BarChartGroupData(
              x: 2,
              barRods: [
                BarChartRodData(
                  toY: 40,
                  width: 70,
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    colors: [Colors.yellow.withOpacity(0.4), Colors.yellow],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter))
              ])
            ])));
  }
}