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

class Ability {
  Ability({
    this.ability,
    this.isHidden,
    this.slot,
  });

  Species? ability;
  bool? isHidden;
  int? slot;

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability: Species.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );

  Map<String, dynamic> toJson() => {
        "ability": ability?.toJson(),
        "is_hidden": isHidden,
        "slot": slot,
      };
}

class Species {
  Species({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

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

class Sprites {
  Sprites(
      {this.backDefault,
      this.backFemale,
      this.backShiny,
      this.backShinyFemale,
      this.frontDefault,
      this.frontFemale,
      this.frontShiny,
      this.frontShinyFemale,
      this.officialArtwork});

  String? backDefault;
  String? backFemale;
  String? backShiny;
  String? backShinyFemale;
  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;
  String? officialArtwork;

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
      backDefault: json["back_default"],
      backFemale: json["back_female"],
      backShiny: json["back_shiny"],
      backShinyFemale: json["back_shiny_female"],
      frontDefault: json["other"]["home"]["front_default"],
      frontFemale: json["other"]["home"]["front_female"],
      frontShiny: json["other"]["home"]["front_shiny"],
      frontShinyFemale: json["other"]["home"]["front_shiny_female"],
      officialArtwork: json["other"]["official-artwork"]["front_default"]);

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_female": backFemale,
        "back_shiny": backShiny,
        "back_shiny_female": backShinyFemale,
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
        "official-artwork": officialArtwork
      };
}

class Stat {
  Stat({
    this.baseStat,
    this.effort,
    this.stat,
  });

  int? baseStat;
  int? effort;
  Species? stat;

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: Species.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat?.toJson(),
      };
}

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
