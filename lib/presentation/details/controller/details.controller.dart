import 'package:ekko/domain/core/abstractions/domain/repositories/pokemon_repository.interface.dart';
import 'package:ekko/domain/core/abstractions/presentation/controllers/details/details_controller.interface.dart';
import 'package:ekko/domain/core/abstractions/presentation/field.interface.dart';
import 'package:ekko/domain/core/abstractions/presentation/stream_field.interface.dart';
import 'package:ekko/domain/core/models/callback.model.dart';
import 'package:ekko/domain/pokemon/models/infos.model.dart';
import 'package:ekko/domain/pokemon/models/pokemon.model.dart';
import 'package:ekko/domain/pokemon/models/stats.model.dart';
import 'package:ekko/domain/pokemon/models/types.model.dart';
import 'package:ekko/presentation/shared/loading/loading.interface.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController implements IDetailsController {
  final IPokemonRepository _pokemonRepository;
  final ILoadingController _loading;
  final IField<String> _sprites;
  final IStreamField<List<TypesModel>?> _types;
  final IStreamField<List<StatsModel>?> _stats;
  final IStreamField<InfoModel?> _infos;
  final PokemonModel? _pokemon;
  final String? _search;

  DetailsController({
    required IPokemonRepository pokemonRepository,
    required ILoadingController loading,
    required IField<String> sprites,
    required IStreamField<List<TypesModel>?> types,
    required IStreamField<List<StatsModel>?> stats,
    required IStreamField<InfoModel?> infos,
    required PokemonModel? pokemon,
    required String? search,
  })  : _pokemonRepository = pokemonRepository,
        _loading = loading,
        _sprites = sprites,
        _stats = stats,
        _types = types,
        _infos = infos,
        _pokemon = pokemon,
        _search = search;

  @override
  IField<String> get sprites => _sprites;

  @override
  IStreamField<List<TypesModel>?> get types => _types;

  @override
  PokemonModel? get pokemon => _pokemon;

  @override
  IStreamField<InfoModel?> get infos => _infos;

  @override
  IStreamField<List<StatsModel>?> get stats => _stats;

  @override
  String? get search => _search;

  @override
  Future<void> loadPokemonDetails({required CallBack<String> onError}) async {
    try {
      _loading.isLoading = true;
      final response = await _pokemonRepository.getPokemonDetails(
        name: pokemon?.name ?? search!,
      );
      _sprites.value = response.sprites.other.officialArtWork.frontDefault;
      _types.value = response.types;
      _infos.value = response.infos;
      _stats.value = response.stats;
    } catch (err) {
      onError('Tente escrever o nome do pokemon em inglês');
    } finally {
      _loading.isLoading = false;
    }
  }
}
