import 'package:hinario_para_criancas_ccb/models/Cards_Models/cards_models.dart';
import 'package:hinario_para_criancas_ccb/models/Question_Model/question_model.dart';
import 'package:hinario_para_criancas_ccb/providers/Question_provider/question_provider.dart';

class QuestionRepository {
  final _client = QuestionProvider();

  List<CardsModels> dataCards() => _client.dataCards();

  List<QuestionModel> dataQuestions() => _client.dataQuestions();
}
