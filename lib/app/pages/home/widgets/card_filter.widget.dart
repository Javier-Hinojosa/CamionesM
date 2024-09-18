import 'package:camionesm/app/pages/nav/items/home/home.controller.dart';
import 'package:camionesm/app/utils/dialog.utils.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/containers/container.widget.dart';
import 'package:camionesm/app/widgets/reactives/reactive_calendar.dart';
import 'package:camionesm/app/widgets/reactives/reactive_dropdown_field.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class HomeCardFilter extends StatelessWidget {

  final FormGroup filterForm;
  final List<String> statesOrigin;
  final List<String> statesDestiny;
  final bool isFilterValid;

  const HomeCardFilter(this.filterForm,{super.key,
    required this.statesDestiny,
    required this.statesOrigin,
    this.isFilterValid=false});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      backgroundColor: Globals.secondColor,
      radius: 60,
      child: SizedBox(
        width: Get.width,
        height: Get.height * .06,
        child: ReactiveForm(
          formGroup: filterForm,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(
                width: Get.width * .35,
                child: _customTextFieldSearch(context, "Origen",
                    (p0) => _localeDialog(context), Keys.stateOrigin)),
              const VerticalDivider(color: Colors.white38, width: 5, thickness: 1),
              SizedBox(
                width: Get.width * .35,
                child: _customTextFieldSearch(context, "Destino",
                        (p0) => _localeDialog(context), Keys.stateDestiny)),
              const VerticalDivider(color: Colors.white38, width: 5, thickness: 1),
              SizedBox(width: Get.width * .05),
              GestureDetector(
                  onTap: () => _calendarDialog(context),
                  child: const CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white24,
                      child: Icon(Icons.calendar_month_outlined, color: Colors.white70, size: 20)))
            ])))).paddingAll(15);
  }

  Widget _customTextFieldSearch(BuildContext context, String hintText,
      void Function(Object) onPressed, String key) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      Expanded(
        child: ReactiveTextField(
            formControlName: key,
            onTap: onPressed,
            readOnly: true,
            style: bodyLarge.apply(color: Colors.white70),
            maxLines: 1,
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: bodyLarge.apply(color: Colors.white70),
                border: InputBorder.none))),
      const CircleAvatar(
          radius: 15,
          backgroundColor: Colors.white24,
          child: Icon(Icons.search, color: Colors.white70)),
          SizedBox(width: Get.width*0.01)
    ]);
  }

  Future<bool> _calendarDialog(BuildContext context) {
    return DialogUtils.dialog(
        child: ListView(shrinkWrap: true, children: [
      Align(
          alignment: Alignment.centerLeft,
          child: CustomText("Calendario", style: titleLarge)),
      CustomText("Selecciona la fecha de origen de tu viaje",
          textAlign: TextAlign.start,
          style: bodyMedium.apply(color: Theme.of(context).disabledColor)),
          ReactiveForm(
              formGroup: filterForm,
              child: const CustomReactiveCalendar(Keys.date)),
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

  Future<bool> _localeDialog(BuildContext context) {
    return DialogUtils.dialog(
        child:  ListView(shrinkWrap: true, children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText("Origen", style: titleLarge)),
              CustomText(
                  "Selecciona uno de tus envíos registrados o registra uno nuevo",
                  textAlign: TextAlign.start,
                  style:
                      bodyMedium.apply(color: Theme.of(context).disabledColor)),
              ReactiveForm(
                  formGroup: filterForm,
                  child: Column(children: [
                    CustomReactiveDropDown(Keys.stateOrigin,
                        paddingAll: 0,
                        labelText: "Estado",
                        hintText: "Selecciona el estado de origen",
                        items: statesOrigin
                            .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                            .toList()),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: CustomText("Destino", style: titleLarge)),
                    CustomReactiveDropDown(Keys.stateDestiny,
                        paddingAll: 0,
                        labelText: "Estado",
                        hintText: "Selecciona el estado de destino",
                        items: statesDestiny
                            .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                            .toList())
                  ])),
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
                          onPressed:  () => Get.back(result: true))))
            ]));
  }


}
