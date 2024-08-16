
import 'package:flutter/material.dart';

class CustomNotification extends StatelessWidget {
  const CustomNotification({super.key,required this.child, this.right=1, this.top=1, this.haveNotification=true});

  final Widget child;
  final double right;
  final double top;
  final bool haveNotification;

  @override
  Widget build(BuildContext context) {
    return !haveNotification?
    child:
    Stack(
        children: [
          child,
          Positioned(
              right: right,
              top: top,
              child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(6)),
                  constraints: const BoxConstraints(
                    minWidth: 12,
                    minHeight: 12)))
        ]);
  }

}