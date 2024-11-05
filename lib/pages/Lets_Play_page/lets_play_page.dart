import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hinario_para_criancas_ccb/components/Radio/radio.dart';
import 'package:hinario_para_criancas_ccb/controllers/Question_controller/question_controller.dart';
import 'package:hinario_para_criancas_ccb/models/Question_Model/question_model.dart';
import 'package:logger/logger.dart';

import '../../components/Cards/cards.dart';
import '../../helpers/Colors/colors_app.dart';

class LetsPlayPage extends StatelessWidget {
  QuestionController controller;
  LetsPlayPage({super.key, required this.controller}) {
    controller.getDataQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: ColorsApp.bluePrimary,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorsApp.blackPrimary,
              size: 30,
            )),
        title: Text(
          "Hinário \n das Crianças",
          style: TextStyle(
              color: ColorsApp.blackPrimary,
              fontFamily: 'Times New Roman',
              fontWeight: FontWeight.w600,
              fontSize: 25),
          textAlign: TextAlign.center,
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
        child: BottomAppBar(
          color: ColorsApp.bluePrimary,
          child: SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Vamos Brincar",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: ColorsApp.blackPrimary,
                      fontFamily: "Times New Roman",
                      fontSize: 22),
                ),
              ],
            ),
          ), // Adjust height as needed
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Obx(() => Cards.cards(
                  label:
                      "${controller.data[controller.count].number} - ${controller.data[controller.count].question}",
                  height: Get.height * 0.15)),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Obx(
                () => Card(
                  elevation: 3,
                  child: Container(
                    width: Get.width,
                    height: Get.height * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [
                          ColorsApp.blueTerciary,
                          ColorsApp.bluePrimary,
                          ColorsApp.blueTerciary
                        ],
                        begin:
                            Alignment.topCenter, // Ponto inicial do gradiente
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        RadioButton.option(
                            controller: controller,
                            option: controller.count % 2 == 0
                                ? controller.data[controller.count].response
                                : controller
                                    .data[controller.count].secondError),
                        RadioButton.option(
                            controller: controller,
                            option:
                                controller.data[controller.count].primaryError),
                        RadioButton.option(
                            controller: controller,
                            option: controller.count % 2 == 0
                                ? controller.data[controller.count].secondError
                                : controller.data[controller.count].response),
                        RadioButton.option(
                            controller: controller,
                            option: controller
                                .data[controller.count].terciaryError),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 124, 240, 15)),
                  onPressed: () {
                    controller.getCount(
                        data: controller.data[controller.count]);
                  },
                  child: const Text(
                    "CONFIRMAR",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Times New Roman"),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
