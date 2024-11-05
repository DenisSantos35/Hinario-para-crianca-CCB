import 'package:flutter_test/flutter_test.dart';
import 'package:hinario_para_criancas_ccb/models/Question_Model/question_model.dart';
import 'package:hinario_para_criancas_ccb/providers/Question_provider/question_provider.dart';

void main() {
  group("teste provider", () {
    test("Teste de retorno de função", () {
      final teste = QuestionProvider();

      expect(teste.dataQuestions().runtimeType, List<QuestionModel>);
    });
  });
}
