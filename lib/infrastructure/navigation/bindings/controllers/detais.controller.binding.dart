import 'package:ekko/domain/core/abstractions/domain/repositories/pokemon_repository.interface.dart';
import 'package:ekko/domain/core/abstractions/presentation/controllers/details/details_controller.interface.dart';
import 'package:ekko/domain/core/abstractions/presentation/field.interface.dart';
import 'package:ekko/domain/core/abstractions/presentation/stream_field.interface.dart';
import 'package:ekko/domain/core/models/getx_field.model.dart';
import 'package:ekko/domain/core/models/rx_field.model.dart';
import 'package:ekko/domain/pokemon/models/infos.model.dart';
import 'package:ekko/domain/pokemon/models/pokemon.model.dart';
import 'package:ekko/domain/pokemon/models/stats.model.dart';
import 'package:ekko/domain/pokemon/models/types.model.dart';
import 'package:ekko/infrastructure/dal/inject.dart';
import 'package:ekko/infrastructure/navigation/bindings/domains/pokemon.repository.binding.dart';
import 'package:ekko/presentation/details/controller/details.controller.dart';
import 'package:ekko/presentation/shared/loading/loading.interface.dart';
import 'package:get/get.dart';

class DetailsControllerBinding extends Bindings {
  @override
  void dependencies() {
    final pokemonRepository = PokemonRepositoryBinding();
    final loading = Inject.find<ILoadingController>();
    final sprites = makeSprites();
    final types = makeTypes();
    final stats = makeStats();
    final infos = makeInfos();

    Inject.lazyPut<IDetailsController>(
      () => makeDetailsController(
        pokemonRepository: pokemonRepository.repository,
        loading: loading,
        sprites: sprites,
        types: types,
        stats: stats,
        infos: infos,
      ),
    );
  }
}

IField<String> makeSprites() {
  return GetxFieldModel<String>(value: '');
}

IStreamField<List<TypesModel>?> makeTypes() {
  return RxFieldModel<List<TypesModel>?>(value: []);
}

IStreamField<List<StatsModel>?> makeStats() {
  return RxFieldModel<List<StatsModel>?>(value: []);
}

IStreamField<InfoModel?> makeInfos() {
  return RxFieldModel<InfoModel>();
}

IDetailsController makeDetailsController({
  required IPokemonRepository pokemonRepository,
  required ILoadingController loading,
  required IField<String> sprites,
  required IStreamField<List<TypesModel>?> types,
  required IStreamField<List<StatsModel>?> stats,
  required IStreamField<InfoModel?> infos,
}) {
  final arguments = Get.arguments as Map<String, dynamic>?;

  PokemonModel? pokemon = arguments?['pokemon'];
  String? search = arguments?['search'];

  return DetailsController(
    pokemonRepository: pokemonRepository,
    loading: loading,
    sprites: sprites,
    types: types,
    stats: stats,
    infos: infos,
    pokemon: pokemon,
    search: search,
  );
}
