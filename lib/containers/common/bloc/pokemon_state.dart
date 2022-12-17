part of 'pokemon_bloc.dart';

@immutable
class PokemonState extends Equatable {
  final bool hasError;
  final bool isPokemonFounded;
  final bool isPokemonPageLoaded;
  final List<Pokemon> pokemons;
  final Pokemon? pokemonResult;
  final Exception? exception;

  const PokemonState({
    this.pokemons = const [],
    this.hasError = false,
    this.isPokemonFounded = false,
    this.isPokemonPageLoaded = false,
    this.pokemonResult,
    this.exception,
  });
  const PokemonState._(
      {this.pokemons = const [],
      this.hasError = false,
      this.isPokemonFounded = false,
      this.isPokemonPageLoaded = false,
      this.pokemonResult,
      this.exception});

  const PokemonState.initial()
      : this._(
          pokemons: const [],
          hasError: false,
          isPokemonFounded: false,
          isPokemonPageLoaded: false,
          pokemonResult: null,
          exception: null,
        );

  PokemonState copyWith({
    bool? hasError,
    bool? isPokemonFounded,
    bool? isPokemonPageLoaded,
    Exception? exception,
    List<Pokemon>? pokemons,
    Pokemon? pokemonResult,
  }) {
    return PokemonState(
      hasError: hasError ?? this.hasError,
      isPokemonFounded: isPokemonFounded ?? this.isPokemonFounded,
      isPokemonPageLoaded: isPokemonPageLoaded ?? this.isPokemonPageLoaded,
      pokemons: pokemons ?? this.pokemons,
      pokemonResult: pokemonResult ?? this.pokemonResult,
      exception: exception ?? this.exception,
    );
  }

  @override
  List<Object> get props => [
        hasError,
        isPokemonFounded,
        isPokemonPageLoaded,
        pokemons,
      ];
}
