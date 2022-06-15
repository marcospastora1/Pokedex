import 'package:ekko/infrastructure/dal/services/data/abilities.data.dart';
import 'package:ekko/infrastructure/dal/services/data/sprites.data.dart';
import 'package:ekko/infrastructure/dal/services/data/stats.data.dart';
import 'package:ekko/infrastructure/dal/services/data/types.data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_pokemon_details.response.g.dart';

@JsonSerializable()
class GetPokemonDetailsDataResponse {
  final List<AbilitiesData>? abilities;
  @JsonKey(name: 'base_experience')
  final int? baseExperience;
  final int? id;
  final String? name;
  final SpritesData? sprites;
  final List<StatsData>? stats;
  final List<TypesData>? types;
  final int? weight;
  final int? height;

  const GetPokemonDetailsDataResponse({
    required this.abilities,
    required this.baseExperience,
    required this.id,
    required this.sprites,
    required this.types,
    required this.stats,
    required this.name,
    required this.weight,
    required this.height,
  });

  factory GetPokemonDetailsDataResponse.fromJson(json) =>
      _$GetPokemonDetailsDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetPokemonDetailsDataResponseToJson(this);
}
