class Player {
  final String id;
  final String name;
  int score;

  Player(this.id, this.name) : score = 0;

  Player.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        name = json['name'] as String,
        score = json['score'] as int;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'score': score,
    };
  }
}
