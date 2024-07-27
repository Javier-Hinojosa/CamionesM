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
  final bool? isActive;
  final IconData? iconSuffix;
  final void Function(FormControl<dynamic>)? onSubmitted;
  final void Function(FormControl<dynamic>)? onChanged;
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
        this.isActive,
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
            child: ReactiveTextField(
              formControlName: controlName,
              controller: textEditing,
              autofocus: false,
              autocorrect: false,
              onSubmitted: onSubmitted,
              onChanged: onChanged,
              scribbleEnabled: isActive ?? true,
              enableInteractiveSelection: isActive ?? true,
              readOnly: !(isActive ?? true),
              inputFormatters: inputFormatters,
              decoration: outLineText(context,hintText: hintText,suffixIcon: iconSuffix,onSuffixIconTap: onSuffixIconTap),
              textCapitalization: inputFormatters != null ? TextCapitalization.characters : TextCapitalization.none,
              enableIMEPersonalizedLearning: false,
              enableSuggestions: false,
              focusNode: isActive != null ? AlwaysDisabledFocusNode() : null,
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
              showCursor: true,
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
fillColor: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
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

