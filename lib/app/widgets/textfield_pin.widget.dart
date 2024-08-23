import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinTextField extends StatelessWidget{

  final TextEditingController textEditingController;
  final double paddingAll;

  const CustomPinTextField(this.textEditingController,{super.key, this.paddingAll=10});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      controller: textEditingController,
      autoDisposeControllers: false,
      length: 4,
      mainAxisAlignment: MainAxisAlignment.center,
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
        fieldOuterPadding: EdgeInsets.all(paddingAll),
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10),
        fieldHeight: 50,
        fieldWidth: 50,
        activeColor: Colors.black,
        inactiveColor: Colors.black,
        selectedColor: Colors.blue));
  }


}