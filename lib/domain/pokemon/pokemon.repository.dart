import 'package:ekko/domain/core/abstractions/domain/repositories/pokemon_repository.interface.dart';
import 'package:ekko/domain/core/abstractions/infrastructure/services/pokemon.service.interface.dart';
import 'package:ekko/domain/pokemon/models/pokemon.model.dart';
import 'package:ekko/domain/pokemon/models/pokemon_details.model.dart';

class PokemonRepository implements IPokemonRepository {
  final IPokemonService _pokemonService;

  const PokemonRepository(IPokemonService pokemonService)
      : _pokemonService = pokemonService;

  @override
  Future<List<PokemonModel>> getPokemons() async {
    try {
      final response = await _pokemonService.getPokemons();
      final models = response.map((e) => PokemonModel.fromData(e)).toList();
      return models;
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<PokemonDetailsModel> getPokemonDetails({required String name}) async {
    try {
      final response = await _pokemonService.getPokemonsDetails(name: name);
      final models = PokemonDetailsModel.fromData(response);
      return models;
    } catch (err) {
      rethrow;
    }
  }
}
