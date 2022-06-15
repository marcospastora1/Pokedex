import 'package:ekko/domain/pokemon/models/abilities.model.dart';
import 'package:ekko/domain/pokemon/models/infos.model.dart';
import 'package:ekko/domain/pokemon/models/sprites.model.dart';
import 'package:ekko/domain/pokemon/models/stats.model.dart';
import 'package:ekko/domain/pokemon/models/types.model.dart';
import 'package:ekko/infrastructure/dal/services/pokemon/dto/get_pokemon_details.response.dart';
import 'package:equatable/equatable.dart';

class PokemonDetailsModel extends Equatable {
  final List<AbilitiesModel> abilities;
  final SpritesModel sprites;
  final List<TypesModel> types;
  final List<StatsModel> stats;
  final InfoModel infos;

  const PokemonDetailsModel({
    required this.abilities,
    required this.sprites,
    required this.types,
    required this.stats,
    required this.infos,
  });

  factory PokemonDetailsModel.fromData(GetPokemonDetailsDataResponse data) {
    return PokemonDetailsModel(
      abilities:
          data.abilities!.map((e) => AbilitiesModel.fromData(e)).toList(),
      sprites: SpritesModel.fromData(data.sprites!),
      types: data.types!.map((e) => TypesModel.fromData(e)).toList(),
      stats: data.stats!.map((e) => StatsModel.fromData(e)).toList(),
      infos: InfoModel(
        baseExperience: data.baseExperience!,
        id: data.id!,
        name: data.name!,
        weight: data.weight!,
        height: data.height!,
      ),
    );
  }

  @override
  List<Object?> get props => [
        abilities,
        sprites,
        types,
        stats,
      ];
}
