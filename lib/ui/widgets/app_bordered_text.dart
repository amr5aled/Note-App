import 'package:flutter/material.dart';
import '../resources/index.dart';

import 'app_text_display.dart';

class AppBorderedText extends StatelessWidget {
  bool? selected;
  String text;

  AppBorderedText({this.selected = false, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(
          10,
        ),
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              width: 1,
              color:
                  selected! ? AppPalette.primaryColor : AppPalette.textColor),
        ),
        child: AppText(
          text: text,
          style: AppTextStyles.body3.copyWith(
              color:
                  selected! ? AppPalette.primaryColor : AppPalette.textColor),
        ),
      ),
    );
  }
}
