class JokeModel {
  final String type;
  final String setup;
  final String punchline;
  final int id;

  JokeModel(this.type, this.setup, this.punchline, this.id);

  factory JokeModel.fromJson(Map<String, dynamic> json) {
    return JokeModel(json["type"] ?? "empty", json["setup"] ?? "empty",
        json["punchline"] ?? "empty", json["id"] ?? 0);
  }
}
