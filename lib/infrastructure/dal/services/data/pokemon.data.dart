import 'package:json_annotation/json_annotation.dart';

part 'pokemon.data.g.dart';

@JsonSerializable()
class PokemonData {
  final String name;
  final String url;

  const PokemonData({required this.name, required this.url});

  factory PokemonData.fromJson(json) => _$PokemonDataFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonDataToJson(this);
}
