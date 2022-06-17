import 'package:ekko/infrastructure/dal/services/data/pokemon.data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_pokemon.response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetPokemonResponse {
  final List<PokemonData>? results;

  const GetPokemonResponse({
    required this.results,
  });

  factory GetPokemonResponse.fromJson(json) =>
      _$GetPokemonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetPokemonResponseToJson(this);
}
