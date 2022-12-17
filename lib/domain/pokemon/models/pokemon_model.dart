import 'package:poke_test/domain/domain.dart';

class Pokemon {
  Pokemon(
      {this.abilities,
      this.baseExperience,
      this.forms,
      this.height,
      this.id,
      this.moves,
      this.name,
      this.order,
      this.species,
      this.sprites,
      this.stats,
      this.types,
      this.weight,
      this.favorite});

  List<Ability>? abilities;
  int? baseExperience;
  List<Species>? forms;
  int? height;
  int? id;
  List<Move>? moves;
  String? name;
  int? order;
  Species? species;
  Sprites? sprites;
  List<Stat>? stats;
  List<Kind>? types;
  int? weight;
  bool? favorite;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
      abilities:
          List<Ability>.from(json["abilities"].map((x) => Ability.fromJson(x))),
      baseExperience: json["base_experience"],
      forms: List<Species>.from(json["forms"].map((x) => Species.fromJson(x))),
      height: json["height"],
      id: json["id"],
      moves: List<Move>.from(json["moves"].map((x) => Move.fromJson(x))),
      name: json["name"],
      order: json["order"],
      species: Species.fromJson(json["species"]),
      sprites: Sprites.fromJson(json["sprites"]),
      stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
      types: List<Kind>.from(json["types"].map((x) => Kind.fromJson(x))),
      weight: json["weight"],
      favorite: false);

  Map<String, dynamic> toJson() => {
        "abilities": List<dynamic>.from(abilities!.map((x) => x.toJson())),
        "base_experience": baseExperience,
        "forms": List<dynamic>.from(forms!.map((x) => x.toJson())),
        "height": height,
        "id": id,
        "moves": List<dynamic>.from(moves!.map((x) => x.toJson())),
        "name": name,
        "order": order,
        "species": species!.toJson(),
        "sprites": sprites!.toJson(),
        "stats": List<dynamic>.from(stats!.map((x) => x.toJson())),
        "types": List<dynamic>.from(types!.map((x) => x.toJson())),
        "weight": weight,
        "favorite": favorite
      };
}
