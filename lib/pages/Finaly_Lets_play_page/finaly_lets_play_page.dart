import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hinario_para_criancas_ccb/controllers/Home_controller/home_controller.dart';
import 'package:hinario_para_criancas_ccb/controllers/Question_controller/question_controller.dart';
import 'package:hinario_para_criancas_ccb/models/Question_Model/question_model.dart';
import 'package:hinario_para_criancas_ccb/pages/Home/home_page.dart';

import '../../components/Cards/cards.dart';
import '../../helpers/Colors/colors_app.dart';

class FinalyLetsPlayPage extends StatelessWidget {
  QuestionController controller;
  FinalyLetsPlayPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: ColorsApp.bluePrimary,
        leading: IconButton(
            onPressed: () {
              Get.lazyPut(() => HomeController());
              Get.offAll(HomePage(controller: HomeController()));
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
                  "Resultado",
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Cards.cards(
                  label:
                      "Você acertou ${controller.correctResponse.length} perguntas",
                  height: Get.height * 0.08),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Obx(
                () => Card(
                  elevation: 3,
                  child: Container(
                      width: Get.width,
                      height: Get.height * 0.5,
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
                      child: ListView.builder(
                          itemCount: controller.correctResponse.length,
                          itemBuilder:
                              <QuestionModel>(BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "${controller.correctResponse[index].number} - ${controller.correctResponse[index].question}",
                                      style: const TextStyle(
                                        fontFamily: "Times New Roman",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "R: ${controller.correctResponse[index].response}, REFERENCIA: ${controller.correctResponse[index].references}",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontFamily: "Times New Roman",
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          })),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
