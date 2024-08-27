import 'package:camionesm/app/pages/nav/items/petitions/contracts/petition_card.contract.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/containers/container.widget.dart';
import 'package:camionesm/app/widgets/containers/container_loading.widget.dart';
import 'package:camionesm/app/widgets/dividers/dotted_divider.widget.dart';
import 'package:camionesm/app/widgets/dividers/dotted_divider_vertical.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class PetitionCardSend extends PetitionCardContract {
  const PetitionCardSend({super.key, this.onPressedReject, this.onPressedAccept, this.onDelete});

  final void Function()? onPressedReject;
  final void Function()? onDelete;
  final void Function()? onPressedAccept;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        elevation: 12,
            backgroundColor: Globals.backgroundColor,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PetitionCardContract.rowIdentify(context, FontAwesomeIcons.paperPlane, "VJ010874"),
                  SizedBox(height: Get.height * 0.02),
                  CustomContainerLoading.image(context,
                      height: Get.height * 0.13,
                      path: Paths.papers),
                  SizedBox(height: Get.height * 0.01),
                  cardDriver(),
                  _cardPointDirections(),
                  SizedBox(height: Get.height * 0.01),
                  cardEarnings(),
                  SizedBox(height: Get.height * 0.02),
                  const DottedDivider(dashSpace: 2),
                  SizedBox(height: Get.height * 0.02),
                  const CustomText("Solicitud enviada de tu viaje"),
                  SizedBox(height: Get.height * 0.02),
                  cardDirections(),
                  SizedBox(height: Get.height * 0.02),
                  const CustomText("Estatus de solicitud"),
                  SizedBox(height: Get.height * 0.01),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: Get.width * 0.33,
                            child: CustomButton(
                                title: "Rechazada",
                                onPressed: onPressedReject,
                                height: Get.height*0.06,
                                width: Get.width * 0.33,
                                backgroundColor: Colors.black)),
                        SizedBox(
                            width: Get.width * 0.33,
                            child: CustomButton(
                                title: "Aceptada",
                                height: Get.height*0.06,
                                width: Get.width * 0.33,
                                onPressed: onPressedAccept,
                                textColor: Colors.white,
                                backgroundColor: Colors.black26)),
                        GestureDetector(
                          onTap: onDelete,
                          child: const CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.black12,
                              child:
                              Icon(Icons.delete_outline,
                                  size: 30,
                                  color: Colors.black)),
                        )
                      ]),
                  SizedBox(height: Get.height * 0.02),
                  cardMoreDetails()
                ]).paddingAll(5));
  }

  Widget _cardPointDirections(){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ListTile(
              contentPadding: EdgeInsets.all(0),
              minVerticalPadding: 0,
              visualDensity: VisualDensity.compact,
              dense: false,
              leading: CircleAvatar(
                  backgroundColor: Globals.principalColor,
                  child: Icon(Icons.location_on_outlined, color: Colors.black, size: 40.0)),
              title: CustomText("Salida", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
              subtitle: CustomText(
                  "CDMX, México. 03/04/24 12:00 hrs",
                  style: TextStyle(fontWeight: FontWeight.w800))),
          VerticalDottedDivider(
              height: Get.height*0.02,
              dashSpace: 3,
              strokeWidth: 4,
              color: Globals.principalColor).paddingOnly(left: 20),
          const ListTile(
              contentPadding: EdgeInsets.all(0),
              minVerticalPadding: 0,
              visualDensity: VisualDensity.compact,
              dense: false,
              leading: CircleAvatar(
                  backgroundColor: Globals.principalColor,
                  child: Icon(Icons.location_on,
                      color: Colors.black, size: 40.0)),
              title: CustomText("Llegada",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400)),
              subtitle: CustomText(
                  "Puebla, México. 03/04/24 12:00 hrs",
                  style: TextStyle(fontWeight: FontWeight.w800)))
        ]);
  }
}
