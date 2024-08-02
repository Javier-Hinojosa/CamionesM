
import 'package:camionesm/app/widgets/cards/custom_shimmer.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingCard extends StatelessWidget {
  final RxBool loading;
  final double? height;
  final Color? color;

  const LoadingCard(
      {super.key, required this.height, required this.loading, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        child: CustomShimmer(
            loading,
            Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                height: height,
                width: MediaQuery.of(context).size.width,
                child: const Card(elevation: 2))));
  }

  static Widget image({required BuildContext context,required double height,required String path }){
    return SizedBox(
        height: height,
        child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            height: height,
            width: MediaQuery.of(context).size.width,
            child: Card(
                elevation: 2,
                child: Image.asset(path, fit: BoxFit.cover, frameBuilder: (context, child, frame, wasSynchronouslyLoaded)  {
                if(wasSynchronouslyLoaded) {
                  return LoadingCard(height: height, loading: true.obs);
                } else {
                  return child;
                }}))));
  }
}
