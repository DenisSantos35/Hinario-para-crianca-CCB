import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dialogs {
  static void erroAlert() {
    Get.dialog(
      AlertDialog(
        title: const Text("Erro ao verificar a opçao!"),
        content: const Text("Escolha uma opção e clique em confirmar"),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent, elevation: 3),
            onPressed: () {
              Get.back();
            },
            child: const Text(
              "CONTINUAR",
              style:
                  TextStyle(fontFamily: "Times New Roman", color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
