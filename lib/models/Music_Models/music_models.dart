class MusicModels {
  int number;
  String name;
  String asset;
  String image;

  MusicModels(
      {required this.number,
      required this.name,
      required this.asset,
      required this.image});

  Map<String, dynamic> toMap() {
    return {"number": number, "name": name, "asset": asset, "image": image};
  }
}
