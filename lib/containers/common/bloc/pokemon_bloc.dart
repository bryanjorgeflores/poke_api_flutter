import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:poke_test/domain/domain.dart';


part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonRepository pokemonRepository = PokemonRepository();
  PokemonBloc() : super(const PokemonState.initial()) {
    on<LoadPokemonsEvent>(_onLoadPokemons);
    on<SearchPokemonEvent>(_onSearchPokemon);
    on<ReinitPokemonsEvent>(_reinitPokemons);
  }

  void _reinitPokemons(
      ReinitPokemonsEvent event, Emitter<PokemonState> emit) async {
    emit(const PokemonState.initial());
  }

  void _onLoadPokemons(
      LoadPokemonsEvent event, Emitter<PokemonState> emit) async {
    await emit.forEach<List<Pokemon>>(pokemonRepository.getAll(event.page ?? 0),
        onData: (pokemons) {
      return state.copyWith(
        pokemons: pokemons,
        isPokemonPageLoaded: true,
      );
    }, onError: <Exception>(exception, __) {
      return state.copyWith(
          isPokemonPageLoaded: false,
          hasError: true,
          exception: exception,
          pokemons: []);
    });
    emit(state.copyWith(isPokemonPageLoaded: false));
  }

  void _onSearchPokemon(
      SearchPokemonEvent event, Emitter<PokemonState> emit) async {
    await emit.forEach<Pokemon>(
        pokemonRepository.getInfoFromPokemon(event.search), onData: (pokemon) {
      return state.copyWith(isPokemonFounded: true, pokemonResult: pokemon);
    }, onError: <Exception>(exception, __) {
      return state.copyWith(
        hasError: true,
        exception: exception,
      );
    });
    emit(state.copyWith(
      hasError: false,
      isPokemonFounded: false,
    ));
  }
}
