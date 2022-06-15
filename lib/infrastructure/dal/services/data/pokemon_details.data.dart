import 'package:ekko/infrastructure/dal/services/data/abilities.data.dart';
import 'package:ekko/infrastructure/dal/services/data/sprites.data.dart';
import 'package:ekko/infrastructure/dal/services/data/stats.data.dart';
import 'package:ekko/infrastructure/dal/services/data/types.data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_details.data.g.dart';

@JsonSerializable()
class PokemonDetailsData {
  final List<AbilitiesData> abilities;
  @JsonKey(name: 'base_experience')
  final int baseExperience;
  final int id;
  final String name;
  final SpritesData sprites;
  final List<StatsData> stats;
  final List<TypesData> types;
  final int weight;

  const PokemonDetailsData({
    required this.abilities,
    required this.baseExperience,
    required this.id,
    required this.sprites,
    required this.types,
    required this.stats,
    required this.name,
    required this.weight,
  });

  factory PokemonDetailsData.fromJson(json) =>
      _$PokemonDetailsDataFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonDetailsDataToJson(this);
}
