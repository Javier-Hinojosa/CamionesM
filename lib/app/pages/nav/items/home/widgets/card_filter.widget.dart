import 'package:camionesm/app/pages/nav/items/home/home.controller.dart';
import 'package:camionesm/app/utils/dialog.utils.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/cards/card_reduce.widget.dart';
import 'package:camionesm/app/widgets/reactives/reactive_dropdown_field.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/keys.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeCardFilter extends GetView<HomeController> {
  const HomeCardFilter({super.key});


  @override
  Widget build(BuildContext context) {
    return CustomCardReduce(
        backgroundColor: Globals.secondColor,
        circularRadius: 30,
        child: SizedBox(
          width: Get.width,
          height: Get.height*.05,
          child: ReactiveForm(
            formGroup: controller.filterForm(),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  width: Get.width*.35,
                  child:  _customTextFieldSearch(context, "Origen", (p0) => _localeDialog(context),Keys.stateOrigin),
                ),
                const VerticalDivider(color: Colors.white38, width: 5, thickness: 1),
                SizedBox(
                  width:  Get.width*.35,
                  child: _customTextFieldSearch(context,"Destino", (p0) => _localeDialog(context),Keys.stateDestiny),
                ),const VerticalDivider(color: Colors.white38, width: 5, thickness: 1),
                SizedBox(
                  width: Get.width*.05,
                ),
                GestureDetector(
                  onTap: ()=> _calendarDialog(context),
                  child: const CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white24,
                      child: Icon(Icons.calendar_month_outlined,color: Colors.white70,size: 20)),
                )
              ],
            ),
          ),
        ),
      ).paddingAll(15);
  }

  Widget _customTextFieldSearch(BuildContext context, String hintText,void Function(Object) onPressed,String key ) {
    return  ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
              width: Get.width*.2,
              child: ReactiveTextField(
                  formControlName: key,
                  onTap: onPressed,
                  readOnly: true,
                  style: Theme.of(context).textTheme.bodyLarge!.apply(color: Colors.white70),
                  maxLines: 1,
                  decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: Theme.of(context).textTheme.bodyLarge!.apply(color: Colors.white70),
                      border: InputBorder.none))
          ),
          SizedBox(width: Get.width*.05),
          const CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white24,
              child: Icon(Icons.search,color: Colors.white70)),
        ]
    ).paddingAll(5);
  }
  Future<bool> _calendarDialog(BuildContext context) {
    return DialogUtils.dialog(
        child: ListView(shrinkWrap: true, children: [
          Align(alignment: Alignment.centerLeft, child: CustomText("Calendario", style: Theme.of(context).textTheme.titleLarge)),
          CustomText("Selecciona la fecha de origen de tu viaje",textAlign: TextAlign.start, style: Theme.of(context).textTheme.bodyMedium!.apply(color: Theme.of(context).disabledColor)),
          _tableCalendar(context),
          Container(padding: const EdgeInsets.all(10)),
          Align(alignment: Alignment.bottomRight,
              child: SizedBox(
                  height: Get.height * 0.05,
                  width: Get.width * 0.4,
                  child: CustomButton(
                      title: "Aceptar",
                      height: Get.height * 0.02,
                      width: Get.width * 0.4,
                      color: Colors.black,
                      onPressed: () =>Get.back(result: true))))
        ]));
  }

  Future<bool> _localeDialog(BuildContext context) {
    return DialogUtils.dialog(
        child: Obx(()=>
            ListView(shrinkWrap: true,
                children: [
                  Align(alignment: Alignment.centerLeft, child: CustomText("Origen", style: Theme.of(context).textTheme.titleLarge)),
                  CustomText("Selecciona uno de tus envíos registrados o registra uno nuevo", textAlign: TextAlign.start, style: Theme.of(context).textTheme.bodyMedium!.apply(color: Theme.of(context).disabledColor)),
                  ReactiveForm(formGroup: controller.filterForm(),
                      child: Column(
                          children: [
                            CustomReactiveDropDown(Keys.stateOrigin,
                                paddingAll: 0,
                                labelText: "Estado",
                                hintText: "Selecciona el estado de origen",
                                items: controller.statesOrigin.map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e))).toList()),
                            Align(alignment: Alignment.centerLeft, child: CustomText("Destino", style: Theme.of(context).textTheme.titleLarge)),
                            CustomReactiveDropDown(Keys.stateDestiny,
                                paddingAll: 0,
                                labelText: "Estado",
                                hintText: "Selecciona el estado de destino",
                                items: controller.statesDestiny.map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e))).toList())
                          ])),
                  Container(padding: const EdgeInsets.all(10)),
                  Align(alignment: Alignment.bottomRight,
                      child: SizedBox(
                          height: Get.height * 0.05,
                          width: Get.width * 0.4,
                          child: CustomButton(
                              title: "Aceptar",
                              height: Get.height * 0.02,
                              width: Get.width * 0.4,
                              color: Colors.black,
                              onPressed: controller.isFilterValid()?() =>Get.back(result: true):null)))
                ])
        ));
  }

  Widget _tableCalendar(BuildContext context) {
    return Obx(()=> TableCalendar(
        firstDay: DateTime.utc(2022, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: controller.focusedDay(),
        calendarFormat: CalendarFormat.month,
        rangeSelectionMode: RangeSelectionMode.disabled,
        selectedDayPredicate: (day) => isSameDay(controller.selectedDay(), day),
        onDaySelected: (selectedDay, focusedDay) => controller.onSelectedCalendar(selectedDay, focusedDay),
        locale: Globals.currentLocaleComplete,
        weekNumbersVisible: false,
        headerStyle:  HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            leftChevronIcon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            rightChevronIcon: const Icon(Icons.arrow_forward_ios, color: Colors.black),
            titleTextStyle: Theme.of(context).textTheme.titleMedium!),
        calendarStyle: const CalendarStyle(isTodayHighlighted: true,
            todayDecoration: BoxDecoration(color: Colors.yellow, shape: BoxShape.circle),
            selectedDecoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle)))
    );
  }

}