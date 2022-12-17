import 'package:poke_test/domain/domain.dart';

class Move {
  Move({
    this.move,
  });

  Species? move;

  factory Move.fromJson(Map<String, dynamic> json) => Move(
        move: Species.fromJson(json["move"]),
      );

  Map<String, dynamic> toJson() => {
        "move": move?.toJson(),
      };
}
