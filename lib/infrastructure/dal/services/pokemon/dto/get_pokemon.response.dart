import 'package:ekko/infrastructure/dal/services/data/pokemon.data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_pokemon.response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetPokemonResponse {
  final String? next;
  final String? previous;
  final List<PokemonData>? results;

  const GetPokemonResponse({
    required this.next,
    required this.previous,
    required this.results,
  });

  factory GetPokemonResponse.fromJson(json) =>
      _$GetPokemonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetPokemonResponseToJson(this);
}
