class CardsModels {
  // List cards = ["Histórias", "Perguntas"];
  //List images = ["assets/images/historias.png", "assets/images/question.png"];
  String title;
  String image;
  String type;
  CardsModels({required this.title, required this.image, required this.type});

  Map<String, dynamic> toMap() {
    return {"title": title, "image": image, "type": type};
  }
}
