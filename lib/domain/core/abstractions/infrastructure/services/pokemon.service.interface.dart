import 'package:ekko/infrastructure/dal/services/data/pokemon.data.dart';
import 'package:ekko/infrastructure/dal/services/pokemon/dto/get_pokemon_details.response.dart';

abstract class IPokemonService {
  Future<List<PokemonData>> getPokemons();
  Future<GetPokemonDetailsDataResponse> getPokemonsDetails({
    required String name,
  });
}
