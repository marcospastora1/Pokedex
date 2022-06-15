import 'package:ekko/domain/core/abstractions/presentation/stream_field.interface.dart';
import 'package:ekko/domain/core/models/callback.model.dart';
import 'package:ekko/domain/pokemon/models/pokemon.model.dart';
import 'package:ekko/domain/pokemon/models/sprites.model.dart';

abstract class IHomeController {
  Future<void> loadPokemons({required CallBack<String> onError});
  Future<void> loadSprites({
    required String name,
    required CallBack<String> onError,
  });

  IStreamField<List<PokemonModel>?> get pokemons;
  IStreamField<SpritesModel?> get sprites;
}
