import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final bool enable;
  final Widget? child;

  const CustomShimmer(this.enable, this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return enable
        ? Shimmer.fromColors(
            baseColor: Colors.grey.shade400,
            highlightColor: Colors.grey.shade200,
            enabled: enable,
            child: child != null
                ? child!
                : const SizedBox(
                    height: 50
                  )
          )
        : child!;
  }
}
