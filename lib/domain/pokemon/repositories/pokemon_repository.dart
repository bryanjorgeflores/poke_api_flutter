import 'package:poke_test/domain/common/mappings/error.mapping.dart';
import 'package:poke_test/domain/domain.dart';
import 'package:rxdart/rxdart.dart';

class PokemonRepository {
  final ErrorMapping _errorMapping = ErrorMapping();
  final PokemonProvider _pokemonProvider = PokemonProvider();

  Stream<List<Pokemon>> getAll(int page) {
    return Stream.fromFuture(_pokemonProvider.getAll(page))
        .map((response) => response.data['results'] as Iterable)
        .map((Iterable data) => data.map((e) => Species.fromJson(e)).toList())
        .flatMap(
            (List<Species> basicPokemons) => getInfoFromPokemons(basicPokemons))
        .handleError(_errorMapping.toThrow);
  }

  Stream<List<Pokemon>> getInfoFromPokemons(List<Species> basicPokemons) {
    return Rx.combineLatest(
      basicPokemons.map((e) => _getInfoFromPokemon$(e)),
      (List<Pokemon> values) => [...values],
    ).asBroadcastStream();
  }

  Stream<Pokemon> _getInfoFromPokemon$(Species specie) {
    return Stream.fromFuture(
            _pokemonProvider.getInfoFromPokemon(specie.name ?? ''))
        .map((response) => Pokemon.fromJson(response.data))
        .handleError(_errorMapping.toThrow);
  }

  Stream<Pokemon> getInfoFromPokemon(String search) {
    return Stream.fromFuture(_pokemonProvider.getInfoFromPokemon(search))
        .map((response) => Pokemon.fromJson(response.data))
        .handleError(_errorMapping.toThrow);
  }
}
