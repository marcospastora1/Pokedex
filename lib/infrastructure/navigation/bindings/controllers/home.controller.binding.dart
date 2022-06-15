import 'package:ekko/domain/core/abstractions/domain/repositories/pokemon_repository.interface.dart';
import 'package:ekko/domain/core/abstractions/presentation/controllers/home/home_controller.interface.dart';
import 'package:ekko/domain/core/abstractions/presentation/stream_field.interface.dart';
import 'package:ekko/domain/core/models/rx_field.model.dart';
import 'package:ekko/domain/pokemon/models/pokemon.model.dart';
import 'package:ekko/domain/pokemon/models/sprites.model.dart';
import 'package:ekko/infrastructure/dal/inject.dart';
import 'package:ekko/infrastructure/navigation/bindings/domains/pokemon.repository.binding.dart';
import 'package:ekko/presentation/home/controller/home.controller.dart';
import 'package:ekko/presentation/shared/loading/loading.interface.dart';
import 'package:get/get.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    final pokemonRepository = PokemonRepositoryBinding();
    final loading = Inject.find<ILoadingController>();
    final pokemons = makePokemonField();
    final sprites = makeSprites();

    Inject.lazyPut<IHomeController>(
      () => makeHomeController(
        pokemonRepository: pokemonRepository.repository,
        pokemons: pokemons,
        loading: loading,
        sprites: sprites,
      ),
    );
  }
}

IStreamField<List<PokemonModel>?> makePokemonField() {
  return RxFieldModel<List<PokemonModel>>(value: []);
}

IStreamField<SpritesModel?> makeSprites() {
  return RxFieldModel<SpritesModel>();
}

IHomeController makeHomeController({
  required IPokemonRepository pokemonRepository,
  required IStreamField<List<PokemonModel>?> pokemons,
  required IStreamField<SpritesModel?> sprites,
  required ILoadingController loading,
}) {
  return HomeController(
    pokemonRepository: pokemonRepository,
    pokemons: pokemons,
    loading: loading,
    sprites: sprites,
  );
}
