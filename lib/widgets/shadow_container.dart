import 'package:flutter/material.dart';

class ShadowContainer extends StatelessWidget {
  const ShadowContainer({
    required this.child,
    this.shadowColor = Colors.red,
    this.height,
    this.width,
    super.key,
  });

  final Widget child;
  final Color shadowColor;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: shadowColor, offset: Offset(5, 5), blurRadius: 5),
        ],
        color: Colors.white,
      ),
      height: height,
      width: width,
      child: Padding(padding: const EdgeInsets.only(top: 30), child: child),
    );
  }
}
