import 'package:flutter/material.dart';

class CustomUnderlineTextField extends StatelessWidget {
  final   Function(String? string)? onClick;
  final   Function()? onTap;
  final  TextEditingController? controller;
  final  TextInputType? inputType;
  final  String? label;
  final  String? hint;
  final  IconData? icon;
  final   String? Function(String?)? validation;
  final  Color color;
  late final  bool obscure;
  late  final  bool enabled;

  CustomUnderlineTextField({
    this.onClick,
    required  this.color,
    this.controller,
    this.inputType,
    this.label,
    this.hint,
    this.validation,
    this.icon,
    this.enabled = true,
    this.obscure = false, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: TextFormField(
          validator: validation,
          onSaved: onClick,
          onChanged: onClick,
          controller: controller,
          obscureText: obscure,
          cursorColor: color,
          onTap: onTap,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Colors.black54,
            ),
            labelText: label,
            labelStyle: TextStyle(color: color),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: color),
            ),
            focusedBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: color)),
          ),
        ));
  }
}
