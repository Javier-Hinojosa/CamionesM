import 'package:camionesm/app/pages/nav/Widgets/simple_title_card.widget.dart';
import 'package:camionesm/app/pages/nav/items/trips/register/trip_confirm.page.dart';
import 'package:camionesm/app/pages/nav/items/trips/register/trip_register.controller.dart';
import 'package:camionesm/app/utils/dialog.utils.dart';
import 'package:camionesm/app/widgets/app_bar/app_bar.widget.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/notification.widget.dart';
import 'package:camionesm/app/widgets/reactives/reactive_calendar.dart';
import 'package:camionesm/app/widgets/reactives/reactive_dropdown_field.widget.dart';
import 'package:camionesm/app/widgets/reactives/reactive_text_field.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class TripRegisterGeneralPage extends GetView<TripRegisterController>{
  const TripRegisterGeneralPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: CustomAppBar(leadingColor: Theme.of(context).scaffoldBackgroundColor,backgroundColor: Globals.principalColor),
          body: SingleChildScrollView(
              child: Column(children: [
                const SimpleTitleCard(CustomNotification(child: CircleAvatar(backgroundColor:Colors.white, child: Icon(Icons.flag_outlined))), "Registrar nuevo viaje"),
                SizedBox(height: Get.height*0.02),
                Align(alignment: Alignment.centerLeft, child: CustomText("Registra un nuevo viaje", style: titleLarge.apply(fontSizeDelta: -4))),
                const Divider(thickness: 2),
                Row(
                    children: [
                      const CircleAvatar(
                          backgroundColor: Globals.principalColor,
                          child: Icon(Icons.local_shipping_outlined)),
                      SizedBox(width: Get.width*0.03),
                      const CircleAvatar(
                          backgroundColor: Globals.principalColor,
                          child: Icon(Icons.group_outlined)),
                      SizedBox(width: Get.width*0.03),
                      CustomText("Camión y conductor",style: bodyLarge.apply(fontWeightDelta: FontWeight.w200.index))
                    ]),
                SizedBox(height: Get.height*0.02),
                Obx(()=> ReactiveForm(
                    formGroup: controller.formRegisterTrip(),
                    child: Column(
                        children: [
                          _customDropDown(Keys.truck,"Camión","Selecciona tu camión",["A","B"],(p0) {}),
                          SizedBox(height: Get.height*0.02),
                          _customDropDown(Keys.driver,"Conductor","Selecciona a tu conductor",["Jose","Juan"],(p0) {}),
                          SizedBox(height: Get.height*0.02),
                          const Divider(thickness: 2),
                          SizedBox(height: Get.height*0.02),
                          Row(
                              children: [
                                const CircleAvatar(backgroundColor: Globals.principalColor, child: Icon(Icons.location_on_outlined)),
                                SizedBox(width: Get.width*0.03),
                                CustomText("Salida",style: bodyLarge.apply(fontWeightDelta: FontWeight.w200.index))
                              ]),
                          SizedBox(height: Get.height*0.02),
                          _customDropDown(Keys.stateOrigin,"Estado","Selecciona el estado de origen",controller.states(),(p0)=> controller.onChangeStateOrigin(p0.value)),

                          SizedBox(height: Get.height*0.02),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    flex:8,
                                    child: _customDropDown(Keys.municipalOrigin,"Alcaldía o municipio","Elije tu municipio de origen",controller.municipalsOriginSelect(),(p0) {})),
                                const Spacer(),
                                Flexible(
                                    flex:4,
                                    child: CustomReactiveTextField(Keys.cpOrigin,
                                        labelText: "Código Postal",
                                        paddingAll: 0,
                                        hintText: "Escribe tu codigo",keyboard: TextInputType.number))
                              ]),
                          SizedBox(height: Get.height*0.02),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    flex:5,
                                    child: CustomReactiveTextField(Keys.dateOrigin,
                                      labelText: "Fecha",
                                      isActive: false,
                                      paddingAll: 0,
                                        iconSuffix: Icons.calendar_month,
                                        onSuffixIconTap: (){},
                                      hintText: "Elije la fecha de origen",
                                      onTap: (p0) => _calendarDialog(context,Keys.dateOrigin,"Selecciona la fecha de origen de tu viaje"))),
                                const Spacer(),
                                Flexible(
                                    flex:5,
                                    child: CustomReactiveTextField(Keys.hourOrigin,
                                        labelText: "Hora aprox.",
                                        isActive: false,
                                        paddingAll: 0,
                                        iconSuffix: Icons.alarm,
                                        onSuffixIconTap: (){},
                                        hintText: "Elije la hora aprox.",
                                        onTap: (p0) => _hourDialog(context,Keys.hourOrigin)))
                              ]),
                          SizedBox(height: Get.height*0.02),
                          const Divider(thickness: 2),
                          SizedBox(height: Get.height*0.02),
                          Row(
                              children: [
                                const CircleAvatar(backgroundColor: Globals.principalColor, child: Icon(Icons.location_on)),
                                SizedBox(width: Get.width*0.03),
                                CustomText("Llegada",style: bodyLarge.apply(fontWeightDelta: FontWeight.w200.index))
                              ]),
                          SizedBox(height: Get.height*0.02),
                          _customDropDown(Keys.stateDestiny,"Estado","Selecciona el estado de destino",controller.states(),(p0)=> controller.onChangeStateDestiny(p0.value)),
                          SizedBox(height: Get.height*0.02),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    flex:8,
                                    child: _customDropDown(Keys.municipalDestiny,"Alcaldía o municipio","Elije tu municipio de destino",controller.municipalsDestinySelect(),(p0) {})),
                                const Spacer(),
                                Flexible(
                                    flex:4,
                                    child: CustomReactiveTextField(Keys.cpDestiny,
                                        labelText: "Código Postal",
                                        paddingAll: 0,
                                        hintText: "Escribe tu codigo",keyboard: TextInputType.number))
                              ]),
                          SizedBox(height: Get.height*0.02),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    flex:5,
                                    child: CustomReactiveTextField(Keys.dateDestiny,
                                      labelText: "Fecha",
                                      isActive: false,
                                      iconSuffix: Icons.calendar_month,
                                      onSuffixIconTap: (){},
                                      paddingAll: 0,
                                      hintText: "Elije la fecha de origen",
                                      onTap: (p0) => _calendarDialog(context,Keys.dateDestiny,"Selecciona la fecha de origen de tu viaje"))),
                                const Spacer(),
                                Flexible(
                                    flex:5,
                                    child: CustomReactiveTextField(Keys.hourDestiny,
                                        labelText: "Hora aprox.",
                                        isActive: false,
                                        iconSuffix: Icons.alarm,
                                        onSuffixIconTap: (){},
                                        paddingAll: 0,
                                        hintText: "Elije la hora aprox.",
                                        onTap: (p0) => _hourDialog(context,Keys.hourDestiny)))
                              ]),
                          SizedBox(height: Get.height*0.02),
                          const Divider(thickness: 2),
                          SizedBox(height: Get.height*0.02),
                          CustomButton(title: "Siguiente",backgroundColor: Colors.black, onPressed: controller.isValidRegisterTripForm()?()=>Get.to(()=>const TripConfirmPage()):null),
                          SizedBox(height: Get.height*0.02)
                        ])))
              ]).paddingAll(20)));
  }

  Widget _customDropDown(String key,String labelText, String hintText, List items, void Function(FormControl<dynamic>)? onChanged ) {
    return  CustomReactiveDropDown(key,
        paddingAll: 0,
        labelText: labelText,
        hintText: hintText,
        onChanged: onChanged,
        items: items.map((e) =>
            DropdownMenuItem(value: e, child: Text(e,softWrap: true,overflow: TextOverflow.ellipsis))).toList());
  }

  Future<bool> _calendarDialog(BuildContext context,String key,String label) {
    return DialogUtils.dialog(
        child: ListView(
            shrinkWrap: true,
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText("Calendario", style: titleLarge)),
              CustomText(label,
                  textAlign: TextAlign.start,
                  style: bodyMedium.apply(color: Theme.of(context).disabledColor)),
              ReactiveForm(
                  formGroup: controller.formRegisterTrip(),
                  child: CustomReactiveCalendar(key)),
              Container(padding: const EdgeInsets.all(10)),
              Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                      height: Get.height * 0.05,
                      width: Get.width * 0.4,
                      child: CustomButton(
                          title: "Aceptar",
                          height: Get.height * 0.02,
                          width: Get.width * 0.4,
                          backgroundColor: Colors.black,
                          onPressed: () => Get.back(result: true))))
            ]));
  }

  Future<bool> _hourDialog(BuildContext context,String key)async {
    var datePicker= TimeOfDay.now();
    final TimeOfDay? pickedTime = await showTimePicker(context: context, initialTime: datePicker);
    if (pickedTime != null) {
      controller.formRegisterTrip().control(key).value=pickedTime.format(context);
    }
    return true;
  }

}