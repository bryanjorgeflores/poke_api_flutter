import 'package:poke_test/core/providers/api_provider.dart';

class PokemonProvider {
  ApiProvider apiProvider = ApiProvider();

  getAll(int page) {
    return apiProvider.get(
      '/pokemon/?limit=10&offset=${10 * page}',
    );
  }

  getInfoFromPokemon(String pokemon) {
    return apiProvider.get(
      '/pokemon/$pokemon',
    );
  }
}
