part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class LoadPokemonsEvent extends PokemonEvent {
  final int? page;
  const LoadPokemonsEvent({this.page});
}

class SearchPokemonEvent extends PokemonEvent {
  final String search;
  const SearchPokemonEvent({required this.search});
}

class ReinitPokemonsEvent extends PokemonEvent {}
