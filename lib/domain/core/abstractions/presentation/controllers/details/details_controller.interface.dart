import 'package:ekko/domain/core/abstractions/presentation/field.interface.dart';
import 'package:ekko/domain/core/abstractions/presentation/stream_field.interface.dart';
import 'package:ekko/domain/core/models/callback.model.dart';
import 'package:ekko/domain/pokemon/models/infos.model.dart';
import 'package:ekko/domain/pokemon/models/pokemon.model.dart';
import 'package:ekko/domain/pokemon/models/stats.model.dart';
import 'package:ekko/domain/pokemon/models/types.model.dart';

abstract class IDetailsController {
  Future<void> loadPokemonDetails({required CallBack<String> onError});

  IField<String> get sprites;
  IStreamField<List<TypesModel>?> get types;
  IStreamField<InfoModel?> get infos;
  IStreamField<List<StatsModel>?> get stats;

  PokemonModel? get pokemon;
  String? get search;
}
