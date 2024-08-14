import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:camionesm/data/models/items/progress.item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomProgressStepTruck extends StatelessWidget{

  final List<bool> isActive;

  const CustomProgressStepTruck({super.key,required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(flex: isActive[0]?10:5, child: _getProgress(ProgressStepItem(isActive:isActive[0],icon: Icons.local_shipping_outlined,title: "Datos generales"))),
          const Spacer(),
          Flexible(flex: isActive[1]?10:5, child: _getProgress(ProgressStepItem(isActive:isActive[1],icon: Icons.article_outlined,title: "Datos específicos"))),
          const Spacer(),
          Flexible(flex: isActive[2]?10:5, child: _getProgress(ProgressStepItem(isActive:isActive[2],icon: Icons.photo_library_outlined,title: "Docs y fotos")))
        ]);
  }

 Widget _getProgress(ProgressStepItem item){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LinearProgressIndicator(value: 1,color: item.isActive?null:Colors.grey[300], borderRadius: BorderRadius.circular(20)),
          SizedBox(height: Get.height*0.01),
          Visibility(
            visible: item.isActive,
            replacement: CircleAvatar(
                backgroundColor: Colors.grey[300],
                child:  Icon(item.icon, color: Colors.black.withOpacity(0.5))),
            child: Row(
                children: [
                   CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Icon(item.icon, color: Colors.white)),
                  SizedBox(width: Get.width*0.01),
                  CustomText(item.title??"",style: bodyMedium)
                ]))
        ]);
  }


}