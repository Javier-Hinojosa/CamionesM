import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomReactiveCalendar extends StatelessWidget {
  final String formControlName;
  final bool isFirstDayNow;

  const CustomReactiveCalendar( this.formControlName,{super.key, this.isFirstDayNow=false});

  @override
  Widget build(BuildContext context) {
    return ReactiveFormField<DateTime, DateTime>(
      formControlName: formControlName,
      builder: (field) {
        return TableCalendar(
            firstDay: isFirstDayNow?DateTime.now():DateTime.utc(1900, 3, 14),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: field.value??DateTime.now(),
            calendarFormat: CalendarFormat.month,
            rangeSelectionMode: RangeSelectionMode.disabled,
            selectedDayPredicate: (day) =>isSameDay(field.value, day),
            onDaySelected: (selectedDay, focusedDay) => field.didChange(selectedDay),
            locale: 'es_ES',
            weekNumbersVisible: false,
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              leftChevronIcon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              rightChevronIcon: const Icon(Icons.arrow_forward_ios, color: Colors.black),
              titleTextStyle: titleMedium),
            calendarStyle: const CalendarStyle(
              isTodayHighlighted: true,
              todayDecoration:
              BoxDecoration(color: Colors.yellow, shape: BoxShape.circle),
              selectedDecoration:
              BoxDecoration(color: Colors.black, shape: BoxShape.circle),
            ));
      }
    );
  }
}