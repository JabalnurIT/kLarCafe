import 'package:flutter/material.dart';

class MainScreenContainer extends StatelessWidget {
  const MainScreenContainer({
    super.key,
    required this.child,
    this.padding,
  });

  final Widget child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: child,
    );
  }
}
