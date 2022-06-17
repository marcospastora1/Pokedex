// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_pokemon.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPokemonResponse _$GetPokemonResponseFromJson(Map<String, dynamic> json) =>
    GetPokemonResponse(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => PokemonData.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$GetPokemonResponseToJson(GetPokemonResponse instance) =>
    <String, dynamic>{
      'results': instance.results?.map((e) => e.toJson()).toList(),
    };
