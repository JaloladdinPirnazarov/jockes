import 'package:hive/hive.dart';

part 'joke_model.g.dart';

@HiveType(typeId: 0)
class JokeModel {
  @HiveField(0)
  final String type;

  @HiveField(1)
  final String setup;

  @HiveField(2)
  final String punchline;

  @HiveField(3)
  final int id;

  bool isFavourite = false;

  JokeModel(this.type, this.setup, this.punchline, this.id);

  factory JokeModel.fromJson(Map<String, dynamic> json) {
    return JokeModel(json["type"] ?? "empty", json["setup"] ?? "empty",
        json["punchline"] ?? "empty", json["id"] ?? 0);
  }
}
