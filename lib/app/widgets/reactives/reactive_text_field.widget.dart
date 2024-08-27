import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomReactiveTextField extends StatelessWidget {
  final String controlName;
  final String labelText;
  final String? hintText;
  final TextInputType? keyboard;
  final int? maxLength;
  final int? minLength;
  final int? maxLines;
  final int? minLines;
  final bool isPass;
  final bool isActive;
  final IconData? iconSuffix;
  final void Function(FormControl<dynamic>)? onSubmitted;
  final void Function(FormControl<dynamic>)? onChanged;
  final void Function(FormControl<dynamic>)? onTap;
  final GestureTapCallback? onSuffixIconTap;
  final TextEditingController textEditing = TextEditingController(text: "");
  final InputDecoration? decoration;
  final String? isNotMatch;
  final double paddingAll;
  final List<TextInputFormatter>? inputFormatters;
  final Color? fillColor;
  final IconData? iconPrefix;
  final GestureTapCallback? onPrefixIconTap;
  final Color? secondaryColor;



  CustomReactiveTextField(
      this.controlName, {
        super.key,
        this.labelText = "",
        this.isActive=true,
        this.maxLength,
        this.minLength,
        this.onSubmitted,
        this.iconSuffix,
        this.onSuffixIconTap,
        this.maxLines,
        this.minLines,
        this.isPass = false,
        this.decoration,
        this.isNotMatch,
        this.keyboard,
        this.paddingAll = 10.0,
        this.inputFormatters,
        this.onChanged,
        this.hintText,
        this.fillColor,
        this.iconPrefix,
        this.onPrefixIconTap,
        this.secondaryColor,
        this.onTap
      });

  @override
  Widget build(BuildContext context) {
    var themeDefault =  Colors.black;
    return Padding(
      padding: EdgeInsets.all(paddingAll),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(labelText,maxLines: 2, style:  TextStyle(color: !isActive? themeDefault.withOpacity(0.5):null, fontWeight: FontWeight.w400)),
          Padding(
            padding:  EdgeInsets.only(top: !isActive?5:10),
            child: ReactiveTextField(
              onTap: onTap,
              formControlName: controlName,
              textInputAction: TextInputAction.next,
              controller: textEditing,
              autofocus: false,
              textAlign: TextAlign.left,
              autocorrect: false,
              onSubmitted: onSubmitted,
              onChanged: onChanged,
              scribbleEnabled: isActive,
              style: TextStyle(color: !isActive?themeDefault.withOpacity(0.5):null),
              enableInteractiveSelection: isActive,
              readOnly: !isActive,
              inputFormatters: inputFormatters,
              decoration: outLineText(context,hintText: hintText,enable:isActive, suffixIcon: iconSuffix,onSuffixIconTap: onSuffixIconTap),
              textCapitalization: inputFormatters != null ? TextCapitalization.characters : TextCapitalization.none,
              enableIMEPersonalizedLearning: false,
              enableSuggestions: true,
              focusNode: isActive?null:AlwaysDisabledFocusNode(), //cursor disable
              maxLines: maxLines ?? 1,
              minLines: minLines ?? 1,
              maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
              maxLength: maxLength,
              buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
              validationMessages: validationMessages(minLength, maxLength, equals: isNotMatch ?? ""),
              keyboardType: keyboard,
              obscureText: isPass,
              clipBehavior: Clip.none,
              scrollPhysics: const NeverScrollableScrollPhysics(),
              showCursor: true))
        ]));
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



Map<String, String Function(Object)>? validationMessages(int? minLength, int? maxLength, {String? equals="No Hay coincidencia"}) =>
    {
      ValidationMessage.required: (e) => 'El campo se encuentra vacío',
      ValidationMessage.minLength: (e) => minLength != null
          ? "Mínimo $minLength Caracteres"
          : "Mínimo de Caracteres",
      ValidationMessage.maxLength: (e) => maxLength != null
          ? "Máximo $maxLength Caracteres"
          : "Máximo de Caracteres",
      ValidationMessage.number: (e) => "Solo se Admiten Números en Unidad",
      ValidationMessage.email: (e) => "Ingrese un correo válido",
    };

 InputDecoration outLineText(BuildContext context,{
  String labelText = "",
  String? hintText="",
  IconData? suffixIcon,
  GestureTapCallback? onSuffixIconTap,
  Color? labelTextColor,
  double borderRadius = 0.0,
  Color? backgroundColor,
  Color? borderSideColor,
  bool enable=true}) {
var themeDefault = borderSideColor ?? Colors.black;
return InputDecoration(
  filled: true,
  enabled: enable,
  fillColor: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
  suffixIcon: suffixIcon != null ? IconButton(
      onPressed: onSuffixIconTap,
      icon: Icon(suffixIcon, color: Colors.black26, size: 18)): null,
  contentPadding: const EdgeInsets.all(15),
  labelText: labelText,
  labelStyle: !enable?TextStyle(color: themeDefault.withOpacity(0.1)):null,
  hintText: hintText,
  hintStyle: const TextStyle(fontSize: 14, color: Colors.black26),
  floatingLabelBehavior: FloatingLabelBehavior.always,
  disabledBorder: const UnderlineInputBorder(),
  enabledBorder: enable?OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: themeDefault)):OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: themeDefault.withOpacity(0.3))),
  border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: themeDefault)),
  focusedBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(style: BorderStyle.solid))
);
}

