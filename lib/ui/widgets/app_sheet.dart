import 'package:flutter/material.dart';
import '../helper/index.dart';


class AppBottomSheet {
  static showBottomSheet(BuildContext context, Widget child) {
    showModalBottomSheet(
      
      isScrollControlled: false,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.w)),
      context: context,
      builder: (_) {
        return Container(
          child: child,
          height: 300.h,
        );
      },
    );
  }
}
