import 'package:flutter/material.dart';
import '../helper/size_extension.dart';
import '../resources/index.dart';
import 'app_size_boxes.dart';

import 'app_text_display.dart';

Widget loadingData() {
  return Center(
      child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircularProgressIndicator(),
      50.heightBox,
      AppText(
        translation: AppStrings.loading,
        fontSize: 15.sp,
      )
    ],
  ));
}
