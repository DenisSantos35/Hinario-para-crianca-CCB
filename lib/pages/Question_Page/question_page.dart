import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hinario_para_criancas_ccb/controllers/Question_controller/question_controller.dart';
import 'package:hinario_para_criancas_ccb/helpers/Colors/colors_app.dart';
import 'package:hinario_para_criancas_ccb/models/Cards_Models/cards_models.dart';

class QuestionPage extends StatelessWidget {
  QuestionController controller;
  QuestionPage({super.key, required this.controller}) {
    cards = controller.dataCards();
  }

  List<CardsModels> cards = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      color: Colors.white,
      child: GridView.builder(
        padding: EdgeInsets.all(16),
        shrinkWrap: true,
        itemCount: cards.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 10, mainAxisExtent: 230),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              controller.getPage(data: cards[index]);
            },
            child: Card(
              child: Container(
                  padding: EdgeInsets.all(4),
                  height: 250,
                  decoration: BoxDecoration(
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
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      Container(
                        width: 300,
                        height: 110,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white),
                        child: Image.asset(
                          cards[index].image,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Container(
                        height: 100,
                        alignment: Alignment.center,
                        child: Text(
                          cards[index].title,
                          style: TextStyle(
                              color: ColorsApp.blackPrimary,
                              fontWeight: FontWeight.w300,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }
}
