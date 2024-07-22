import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomReactiveDropDown<T> extends StatelessWidget{
  final String controlName;
  final List<DropdownMenuItem<T>> items;
  final String labelText;
  final String? hintText;
  final bool? isActive;
  final IconData? iconSuffix;
  final void Function(FormControl<dynamic>)? onChanged;
  final GestureTapCallback? onSuffixIconTap;
  final InputDecoration? decoration;
  final String? isNotMatch;
  final double paddingAll;
  final Color? fillColor;
  final IconData? iconPrefix;
  final GestureTapCallback? onPrefixIconTap;
  final Color? secondaryColor;

  CustomReactiveDropDown(
      this.controlName, {
        super.key,
      required  this.items,
        this.labelText = "",
        this.isActive,
        this.iconSuffix,
        this.onSuffixIconTap,
        this.decoration,
        this.isNotMatch,
        this.paddingAll = 10.0,
        this.onChanged,
        this.hintText,
        this.fillColor,
        this.iconPrefix,
        this.onPrefixIconTap,
        this.secondaryColor,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(paddingAll),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(labelText,style: const TextStyle(fontWeight: FontWeight.w400)),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ReactiveDropdownField<T>(
                items: items,
                formControlName: controlName,
                autofocus: false,
                validationMessages: validationMessages(equals: isNotMatch ?? ""),
                onChanged: onChanged,
                readOnly: !(isActive ?? true),
                decoration: outLineText(context,hintText: hintText,suffixIcon: iconSuffix,onSuffixIconTap: onSuffixIconTap),
                focusNode: isActive != null ? AlwaysDisabledFocusNode() : null,
              ),
            ),
          ],
        )
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
  @override
  bool get skipTraversal => true;
  @override
  bool get canRequestFocus => true;
}



Map<String, String Function(Object)>? validationMessages({String? equals="No Hay coincidencia"}) =>
    {
      ValidationMessage.required: (e) => 'El campo se encuentra vacío',
      ValidationMessage.number: (e) => "Solo se Admiten Números en Unidad",
      ValidationMessage.email: (e) => "Ingrese un correo válido",
    };

InputDecoration outLineText(BuildContext context,
    {String labelText = "",
      String? hintText="",
      IconData? suffixIcon,
      GestureTapCallback? onSuffixIconTap,
      Color? labelTextColor,
      double borderRadius = 0.0,
      Color? backgroundColor,
      Color? borderSideColor}) {
  var themeDefault = borderSideColor ?? Colors.black;
  return InputDecoration(
    filled: true,
    fillColor: backgroundColor ?? Theme
        .of(context)
        .scaffoldBackgroundColor,
    suffixIcon: suffixIcon != null
        ? IconButton(
        icon: Icon(
          suffixIcon,
          color: Colors.black26,
          size: 18,
        ),
        onPressed: onSuffixIconTap)
        : null,
    contentPadding: const EdgeInsets.all(15),
    labelText: labelText,
    hintText: hintText,
    hintStyle: const TextStyle(fontSize: 14, color: Colors.black26),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(10.0)
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(
        color: themeDefault,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(color: themeDefault),
    ),
    focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(style: BorderStyle.solid)),
    counterText: "",
  );
}