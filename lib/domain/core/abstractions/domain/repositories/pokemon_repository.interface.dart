import 'package:ekko/domain/pokemon/models/pokemon.model.dart';
import 'package:ekko/domain/pokemon/models/pokemon_details.model.dart';

abstract class IPokemonRepository {
  Future<List<PokemonModel>> getPokemons();
  Future<PokemonDetailsModel> getPokemonDetails({required String name});
}
