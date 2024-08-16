import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:camionesm/data/models/items/progress.item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomProgressStepDriver extends StatelessWidget{

  final List<bool> isActive;

  const CustomProgressStepDriver({super.key,required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(flex: 5, child: _getProgress(ProgressStepItem(isActive:isActive[0],icon: Icons.person_add_alt_1_outlined,title: "Datos generales"))),
          const Spacer(),
          Flexible(flex: 5, child: _getProgress(ProgressStepItem(isActive:isActive[1],icon: Icons.photo_library_outlined,title: "Docs y fotos")))
        ]);
  }

 Widget _getProgress(ProgressStepItem item){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LinearProgressIndicator(value: 1,color: item.isActive?null:Colors.grey[300], borderRadius: BorderRadius.circular(20)),
          SizedBox(height: Get.height*0.01),
          Row(
              children: [
                 CircleAvatar(
                    backgroundColor: item.isActive?Colors.black:Colors.grey[300],
                    child: Icon(item.icon, color: item.isActive?Colors.white:Colors.black.withOpacity(0.5))),
                SizedBox(width: Get.width*0.01),
                CustomText(item.title??"",style: bodyMedium)
              ])
        ]);
  }


}