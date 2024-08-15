
import 'package:camionesm/app/widgets/containers/custom_shimmer.widget.dart';
import 'package:flutter/material.dart';

class CustomContainerLoading extends StatelessWidget {
  final bool loading;
  final double? height;
  final Color? color;

  const CustomContainerLoading(
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

  static Widget image(BuildContext context,{required double height,required String path }){
    return SizedBox(
      height: height,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        height: height,
        width: MediaQuery.of(context).size.width,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              path,
              fit: BoxFit.cover,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                if (wasSynchronouslyLoaded) {
                  return child;
                } else {
                  return CustomContainerLoading(height: height, loading: true);
                }
              }
            )))));
  }
}
