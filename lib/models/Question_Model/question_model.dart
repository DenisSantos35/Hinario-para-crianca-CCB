class QuestionModel {
  String number;
  String question;
  String response;
  String references;
  String primaryError;
  String secondError;
  String terciaryError;

  QuestionModel(
      {required this.number,
      required this.question,
      required this.response,
      required this.references,
      required this.primaryError,
      required this.secondError,
      required this.terciaryError});

  Map<String, dynamic> toMap() {
    return {
      "number": number,
      "question": question,
      "response": response,
      "references": references,
      "primaryError": primaryError,
      "secondError": secondError,
      "terciaryError": terciaryError
    };
  }
}
