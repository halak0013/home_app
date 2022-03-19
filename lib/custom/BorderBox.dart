import 'package:flutter/material.dart';

class BorderBox extends StatelessWidget {
  final Widget? child;
  final EdgeInsets? padding;
  final double? width, height;

  const BorderBox(
      {Key? key, required this.child, this.padding, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
