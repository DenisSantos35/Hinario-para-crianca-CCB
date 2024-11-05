import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hinario_para_criancas_ccb/components/Text/text.dart';
import 'package:hinario_para_criancas_ccb/controllers/Home_controller/home_controller.dart';
import 'package:hinario_para_criancas_ccb/helpers/Colors/colors_app.dart';
import 'package:hinario_para_criancas_ccb/models/Music_Models/music_models.dart';
import 'package:hinario_para_criancas_ccb/pages/Hino_Page/hino_page.dart';

class SearchHinosPage extends StatelessWidget {
  HomeController controller;
  SearchHinosPage({super.key, required this.controller}) {
    dataHinos();
  }

  List<MusicModels> data = [];

  void dataHinos() {
    data = controller.getListHinos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorsApp.whitePrimary,
        child: ListView.builder(
            itemCount: controller.getListHinos().length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Get.to(HinoPage(dataMusic: data[index]));
                },
                child: Card(
                    child: Container(
                  padding: EdgeInsets.only(left: 32),
                  height: 80,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          ColorsApp.blueTerciary,
                          ColorsApp.bluePrimary,
                          ColorsApp.blueTerciary
                        ], // Defina as cores do gradiente aqui
                        begin: Alignment.topLeft, // Ponto inicial do gradiente
                        end: Alignment.bottomRight, // Ponto final do gradiente
                      ),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextData.text(label: '${data[index].number} -'),
                      TextData.text(label: data[index].name),
                      Icon(
                        Icons.music_note_outlined,
                        color: ColorsApp.blackPrimary,
                        size: 30,
                      )
                    ],
                  ),
                )),
              );
            }),
      ),
    );
  }
}
