import 'package:poke_test/domain/domain.dart';

class Kind {
  Kind({
    this.slot,
    this.type,
  });

  int? slot;
  Species? type;

  factory Kind.fromJson(Map<String, dynamic> json) => Kind(
        slot: json["slot"],
        type: Species.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type?.toJson(),
      };
}
