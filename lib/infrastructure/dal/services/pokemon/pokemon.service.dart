import 'package:ekko/domain/core/abstractions/infrastructure/http_connect.interface.dart';
import 'package:ekko/domain/core/abstractions/infrastructure/services/pokemon.service.interface.dart';
import 'package:ekko/domain/core/exceptions/default.exception.dart';
import 'package:ekko/infrastructure/dal/services/data/pokemon.data.dart';
import 'package:ekko/infrastructure/dal/services/pokemon/dto/get_pokemon.response.dart';
import 'package:ekko/infrastructure/dal/services/pokemon/dto/get_pokemon_details.response.dart';

class PokemonService implements IPokemonService {
  final IHttpConnect _connect;
  const PokemonService(IHttpConnect connect) : _connect = connect;

  final prefix = 'pokemon';

  @override
  Future<List<PokemonData>> getPokemons() async {
    final response = await _connect.get(
      '/$prefix/?offset=0&limit=10228',
      decoder: GetPokemonResponse.fromJson,
    );

    if (response.success) {
      return response.payload!.results!;
    } else {
      switch (response.statusCode) {
        default:
          throw DefaultException(message: 'Erro ao pegar pokemons');
      }
    }
  }

  @override
  Future<GetPokemonDetailsDataResponse> getPokemonsDetails(
      {required String name}) async {
    final response = await _connect.get(
      '$prefix/$name',
      decoder: GetPokemonDetailsDataResponse.fromJson,
    );

    if (response.success) {
      return response.payload!;
    } else {
      switch (response.statusCode) {
        default:
          throw DefaultException(
            message: 'Falha ao pegar detalhe dos pokemons',
          );
      }
    }
  }
}
