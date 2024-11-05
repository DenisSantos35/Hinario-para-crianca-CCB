import 'package:get/get.dart';
import 'package:hinario_para_criancas_ccb/models/Cards_Models/cards_models.dart';
import 'package:hinario_para_criancas_ccb/models/Question_Model/question_model.dart';
import 'package:hinario_para_criancas_ccb/pages/Finaly_Lets_play_page/finaly_lets_play_page.dart';
import 'package:hinario_para_criancas_ccb/pages/History_Page/history_page.dart';
import 'package:hinario_para_criancas_ccb/pages/Questionary_Page/questionary_page.dart';
import 'package:hinario_para_criancas_ccb/repositories/Question_Repository/question_repository.dart';

import '../../helpers/Dialogs/dialogs.dart';
import '../../pages/Lets_Play_page/lets_play_page.dart';

class QuestionController extends GetxController {
  final _client = QuestionRepository();

  final _selectedOption = "".obs;
  final _count = 0.obs;
  final _correctResponse = [].obs;
  final _data = [].obs;

  List get data => _data.value;
  set data(List value) => _data.call(value);

  String? get selectedOption => _selectedOption.value;
  set selectedOption(String? value) => _selectedOption.call(value);

  int get count => _count.value;
  set count(int value) => _count.call(value);

  List get correctResponse => _correctResponse.value;
  set correctResponse(List value) => _correctResponse.call(value);

  void getDataQuestion() {
    data = dataQuestions();
    count = 0;
    correctResponse = [];
  }

  void getCount({required QuestionModel data}) {
    if (selectedOption!.isEmpty || selectedOption == null) {
      Dialogs.erroAlert();
    } else {
      verifyQuestion(data: data);
      count++;
      selectedOption = "";
      if (count > 48) {
        Get.to(FinalyLetsPlayPage(controller: this));
        count = 0;
      }
    }
  }

  void verifyQuestion({required QuestionModel data}) {
    if (data.response == selectedOption) {
      correctResponse.add(data);
    }
  }

  List<CardsModels> dataCards() {
    List<CardsModels> result = _client.dataCards();
    return result;
  }

  void getPage({required CardsModels data}) {
    if (data.type == "historia") {
      Get.to(const HistoryPage());
    } else if (data.type == "perguntas") {
      Get.to(const QuestionaryPage());
    } else if (data.type == "vamosBrincar") {
      Get.lazyPut(() => QuestionController());
      Get.to(LetsPlayPage(
        controller: QuestionController(),
      ));
    }
  }

  List<QuestionModel> dataQuestions() {
    List<QuestionModel> result = _client.dataQuestions();
    return result;
  }
}
