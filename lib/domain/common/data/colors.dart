import 'package:flutter/animation.dart';

enum PokemonColors {
  normal(
    'normal',
    Color(0xffa8a878),
  ),
  grass(
    'grass',
    Color(0xff78c850),
  ),
  ground(
    'ground',
    Color(0xffe0c068),
  ),
  fighting(
    'fighting',
    Color(0xffc03028),
  ),
  rock(
    'rock',
    Color(0xffb8a038),
  ),
  steel(
    'steel',
    Color(0xffb8b8d0),
  ),
  fire(
    'fire',
    Color(0xfff08030),
  ),
  electric(
    'electric',
    Color(0xfff8d030),
  ),
  flying(
    'flying',
    Color(0xffa890f0),
  ),
  psychic(
    'psychic',
    Color(0xfff85888),
  ),
  bug(
    'bug',
    Color(0xffa8b820),
  ),
  dragon(
    'dragon',
    Color(0xff7038f8),
  ),
  water(
    'water',
    Color(0xff6890f0),
  ),
  ice(
    'ice',
    Color(0xff98d8d8),
  ),
  poison(
    'poison',
    Color(0xff705848),
  ),
  dark(
    'dark',
    Color(0xff705898),
  ),
  ghost(
    'ghost',
    Color(0xffffaec9),
  ),
  fairy(
    'fairy',
    Color(0xffe0c068),
  );

  const PokemonColors(this.code, this.color);
  final String code;
  final Color color;

  Color get colorValue => color;
}

extension PokemonColorExtension on PokemonColors {
  Color getColor(data){
    return PokemonColors.values.firstWhere((element) => element == data).color;
  }
}
