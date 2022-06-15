import 'package:ekko/domain/core/abstractions/domain/repositories/pokemon_repository.interface.dart';
import 'package:ekko/domain/core/abstractions/infrastructure/http_connect.interface.dart';
import 'package:ekko/domain/pokemon/pokemon.repository.dart';
import 'package:ekko/infrastructure/dal/inject.dart';
import 'package:ekko/infrastructure/dal/services/pokemon/pokemon.service.dart';

class PokemonRepositoryBinding {
  late IPokemonRepository _pokemonRepository;
  IPokemonRepository get repository => _pokemonRepository;

  PokemonRepositoryBinding() {
    final connect = Inject.find<IHttpConnect>();
    final pokemonService = PokemonService(connect);
    _pokemonRepository = PokemonRepository(pokemonService);
  }
}
