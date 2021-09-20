import 'package:flutter/material.dart';

import 'index.dart';

showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: AppText(
    text: text,
  )));
}
