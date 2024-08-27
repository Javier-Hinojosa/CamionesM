import 'dart:io';

import 'package:camionesm/app/widgets/containers/container.widget.dart';
import 'package:camionesm/app/widgets/containers/container_outline.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/enums.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CustomContainerPutArchives extends StatelessWidget{
  final String? title;
  final List<Archives> typeArchives;
  final void Function()? onTap;
  late final String _labelTypeArchives;

   CustomContainerPutArchives({super.key, this.title, this.onTap,this.typeArchives=Archives.values}){
     _labelTypeArchives= _getLabel();
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
          child: Column(
              children: [
                title!=null?
                Column(children: [
                    Align(alignment: Alignment.centerLeft, child: CustomText(title??"", style: titleLarge.apply(fontSizeDelta: -12))),
                    SizedBox(height: Get.height*0.02),
                  ]):Container(),
                Align(alignment: Alignment.centerLeft, child: CustomText("Cargar Archivo", style: bodyMedium)),
                SizedBox(height: Get.height*0.01),
                Align(alignment: Alignment.centerLeft, child: CustomText("Sólo archivos$_labelTypeArchives con menos de 100kb", style: bodyMedium.apply(color: Colors.black))),
                SizedBox(height: Get.height*0.01),
                GestureDetector(
                    onTap: onTap,
                    child: SizedBox(
                        width: Get.width*0.8,
                        height: Get.height*0.15,
                        child: CustomContainerOutline.dotted(
                            contentPadding: 10,
                            backgroundColor: Globals.principalColor.withAlpha(50),
                            children: [
                              Center(
                                  child: SizedBox(
                                      width: Get.width*0.35,
                                      height: Get.height*0.08,
                                      child: CustomContainerOutline(
                                          radius: 10,
                                          backgroundColor: Globals.principalColor,
                                          children: const [
                                            Icon(Icons.add_a_photo_outlined,color: Colors.black,size: 30)
                                          ])))
                            ])))
              ]));
  }

 String _getLabel() {
   String  label="";
   for (var element in typeArchives) {
     switch(element){
       case Archives.jpg: label="$label jpg,";
       case Archives.pdf: label="$label pdf,";
       case Archives.png: label="$label png,";
       case Archives.xml: label="$label xml,";
     }}

   label = label.substring(0, label.length - 1);
     return label;
  }

  void pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
       var selectedFile = File(pickedFile.path);
     // pdfController = null;
    }
  }




}