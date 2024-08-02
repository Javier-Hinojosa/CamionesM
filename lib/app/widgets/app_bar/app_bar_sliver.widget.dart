import 'package:camionesm/app/widgets/buttons/icon_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomSliverAppBar extends StatelessWidget{
  const CustomSliverAppBar({super.key,this.onBack,required this.trailing, this.backgroundImage});

  final void Function()? onBack;
  final Widget trailing;
  final String? backgroundImage;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        automaticallyImplyLeading: false,
        expandedHeight: 290,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        flexibleSpace:  FlexibleSpaceBar(
            background: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(3)),
               child: backgroundImage!=null?Image.asset(backgroundImage!, fit: BoxFit.fill):Container()
            )),
        actions: <Widget>[
          const SizedBox(width: 10),
          IconButton(
              onPressed: onBack??()=>Get.back(), icon: CustomIconButton(backgroundColor: Theme.of(context).scaffoldBackgroundColor)),
          const Spacer(),
          trailing,
          const SizedBox(width: 10)
        ]);
  }

}