import 'package:flutter/material.dart';
import 'package:hinario_para_criancas_ccb/controllers/Question_controller/question_controller.dart';

class RadioButton {
  static Widget option(
      {required String option, required QuestionController controller}) {
    return ListTile(
      title: Text(
        option,
        style: TextStyle(fontSize: 16, fontFamily: "Times New Roman"),
      ),
      leading: Radio<String>(
        activeColor: Colors.white,
        value: option,
        groupValue: controller.selectedOption,
        onChanged: (String? value) {
          controller.selectedOption = value;
          print(value);
        },
      ),
    );
  }
}
