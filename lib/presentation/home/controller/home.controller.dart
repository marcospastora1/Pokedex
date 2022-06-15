import 'package:ekko/domain/core/abstractions/domain/repositories/pokemon_repository.interface.dart';
import 'package:ekko/domain/core/abstractions/presentation/controllers/home/home_controller.interface.dart';
import 'package:ekko/domain/core/abstractions/presentation/stream_field.interface.dart';
import 'package:ekko/domain/core/models/callback.model.dart';
import 'package:ekko/domain/pokemon/models/pokemon.model.dart';
import 'package:ekko/domain/pokemon/models/sprites.model.dart';
import 'package:ekko/presentation/shared/loading/loading.interface.dart';
import 'package:get/get.dart';

class HomeController extends GetxController implements IHomeController {
  final IPokemonRepository _pokemonRepository;
  final IStreamField<List<PokemonModel>?> _pokemons;
  final IStreamField<SpritesModel?> _sprites;
  final ILoadingController _loading;

  HomeController({
    required IPokemonRepository pokemonRepository,
    required IStreamField<List<PokemonModel>?> pokemons,
    required ILoadingController loading,
    required IStreamField<SpritesModel?> sprites,
  })  : _pokemonRepository = pokemonRepository,
        _pokemons = pokemons,
        _loading = loading,
        _sprites = sprites;

  @override
  IStreamField<List<PokemonModel>?> get pokemons => _pokemons;

  @override
  IStreamField<SpritesModel?> get sprites => _sprites;

  @override
  Future<void> loadPokemons({required CallBack<String> onError}) async {
    try {
      _loading.isLoading = true;
      final response = await _pokemonRepository.getPokemons();
      _pokemons.value = response;
    } catch (err) {
      onError(err.toString());
    } finally {
      _loading.isLoading = false;
    }
  }

  @override
  Future<void> loadSprites({
    required String name,
    required CallBack<String> onError,
  }) async {
    try {
      _loading.isLoading = true;
      final response = await _pokemonRepository.getPokemonDetails(name: name);
      sprites.value = response.sprites;
    } catch (err) {
      onError(err.toString());
    } finally {
      _loading.isLoading = false;
    }
  }
}
