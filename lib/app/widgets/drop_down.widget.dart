import 'package:camionesm/app/widgets/reactives/reactive_dropdown_field.widget.dart';
import 'package:flutter/material.dart';

class CustomDropDown<T> extends StatelessWidget{
  final List<DropdownMenuItem<T>> items;
  final String? labelText;
  final String? hintText;
  final bool? isActive;
  final IconData? iconSuffix;
  final void Function(T?)? onChanged;
  final GestureTapCallback? onSuffixIconTap;
  final InputDecoration? decoration;
  final String? isNotMatch;
  final double paddingAll;
  final Color? fillColor;
  final IconData? iconPrefix;
  final GestureTapCallback? onPrefixIconTap;
  final Color? secondaryColor;
  final T? value;

  const CustomDropDown({
        super.key,
        required  this.items,
        this.labelText,
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
    this.value
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(paddingAll),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            labelText!=null?Text(labelText!,style: const TextStyle(fontWeight: FontWeight.w400)):Container(),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: DropdownButtonFormField<T>(
                items: items,
                autofocus: false,
                value: value,
                onChanged: onChanged,
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
