import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helper/app_validator.dart';

class PinCode extends StatefulWidget {
  final TextEditingController? controller;

  PinCode({required this.controller});

  @override
  _PinCodeState createState() => _PinCodeState();
}

class _PinCodeState extends State<PinCode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: PinCodeTextField(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          appContext: context,
          controller: widget.controller,
          validator: (value) => AppValidator.validatorRequired(value, context),
          onChanged: (value) {},
          length: 4,
          obscureText: false,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderWidth: 2,
            borderRadius: BorderRadius.circular(20.0.r),
            disabledColor: Colors.white,
            activeFillColor: Colors.white,
            inactiveFillColor: Colors.white,
            selectedFillColor: Colors.white,
            inactiveColor: Colors.grey,
            selectedColor: Colors.yellow,
            activeColor: Colors.white,
            fieldHeight: 80.h,
            fieldWidth: 50.w,
          ),
          animationDuration: Duration(milliseconds: 300),
          enableActiveFill: true,
          keyboardType: TextInputType.number,
          onCompleted: (v) {
            print("Completed");
          },
        ),
      ),
    );
  }
}
