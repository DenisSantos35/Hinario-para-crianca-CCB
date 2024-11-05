import 'package:flutter/material.dart';
import 'package:hinario_para_criancas_ccb/helpers/Colors/colors_app.dart';

class TextData {
  static Text text({required String label}) {
    return Text(
      label,
      style: TextStyle(
          color: ColorsApp.blackPrimary,
          fontWeight: FontWeight.bold,
          fontFamily: "Times New Roman",
          fontSize: 22),
    );
  }
}
