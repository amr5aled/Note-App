import 'package:flutter/material.dart';
import '../helper/index.dart';

import 'index.dart';

class AppPadding extends StatelessWidget {
  const AppPadding({Key? key, required this.child, this.padding}) : super(key: key);
  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(16.w),
      child: child,
    );
  }
}
