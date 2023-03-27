// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/shape/gf_textfield_shape.dart';

class LaInput extends StatelessWidget {
  LaInput({
    Key? key,
    this.controller,
    required this.text,
    this.type = GfFormFieldType.text,
    this.obscure = false,
    this.prefixIcon,
  }) : super(key: key);

  GfFormFieldType type;
  String text;
  TextEditingController? controller;
  bool obscure;
  IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.of(context).size.width;

    return GfFormField(
      obscuringCharacter: "°",
      obscureText: obscure,
      controller: controller,
      gfFormFieldType: type,
      editingbordercolor: Theme.of(context).primaryColor,
      idlebordercolor: Colors.black,
      borderwidth: 1,
      iconPrefix: Icon(prefixIcon),
      hintText: text,
      marginhorizontal: sw / 20,
      declineButtonText: "Mafff !",
      backgroundcolor: Colors.white70,
      shape: GFTextFieldShape.pills,
    );
  }
}
