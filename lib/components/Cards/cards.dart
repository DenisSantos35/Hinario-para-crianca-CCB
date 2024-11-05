import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helpers/Colors/colors_app.dart';

class Cards {
  static cards({required String label, required double height}) {
    return Card(
      elevation: 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [
              ColorsApp.blueTerciary,
              ColorsApp.bluePrimary,
              ColorsApp.blueTerciary
            ],
            begin: Alignment.topCenter, // Ponto inicial do gradiente
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.all(14),
        alignment: Alignment.center,
        height: height,
        width: Get.width,
        child: Text(
          label,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Times New Roman",
              fontSize: 14),
        ),
      ),
    );
  }
}
