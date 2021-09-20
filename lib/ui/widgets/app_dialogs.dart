import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AppDialogs {
  static void showConfirmDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      animType: AnimType.BOTTOMSLIDE,
      // body: const MessageAlert(),
      dialogType: DialogType.NO_HEADER,
    ).show();
  }

  // static void showCustomDialog(BuildContext context, Widget child) {
  //   AwesomeDialog(
  //     context: context,
  //     animType: AnimType.BOTTOMSLIDE,
  //     body: CustomDialogWidget(
  //       child: child,
  //     ),
  //     dialogType: DialogType.NO_HEADER,
  //   ).show();
  // }

  // static void showErrorDialog(
  //   BuildContext context,
  //   String message, {
  //   bool dismissable = true,
  //   Function? onOkClicked,
  // }) {
  //   AwesomeDialog(
  //     context: context,
  //     animType: AnimType.BOTTOMSLIDE,
  //     body: ErrorDialogWidget(
  //       message,
  //       onOkClicked: onOkClicked,
  //     ),
  //     dialogType: DialogType.NO_HEADER,
  //     dismissOnBackKeyPress: dismissable,
  //     dismissOnTouchOutside: dismissable,
  //   ).show();
  // }

  // static void showAlertDialog(BuildContext context, String message) {
  //   AwesomeDialog(
  //     context: context,
  //     animType: AnimType.BOTTOMSLIDE,
  //     body: AlertDialogWidget(message),
  //     dialogType: DialogType.NO_HEADER,
  //   ).show();
  // }

  // /// Show Logout Dialog
  // static void confirmLogout(BuildContext context, {required GestureTapCallback logOutAction}) {
  //   AwesomeDialog(
  //     context: context,
  //     animType: AnimType.BOTTOMSLIDE,
  //     body: LogoutDialogWidget(logOutAction: logOutAction),
  //     dialogType: DialogType.NO_HEADER,
  //   ).show();
  //   // show the dialog
  // }

  // static void showSuccessDialog(BuildContext context, String message) {
  //   AwesomeDialog(
  //     context: context,
  //     animType: AnimType.BOTTOMSLIDE,
  //     body: SuccessDialogWidget(message),
  //     dialogType: DialogType.NO_HEADER,
  //   ).show();
  // }
}
