// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_pokemon_details.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPokemonDetailsDataResponse _$GetPokemonDetailsDataResponseFromJson(
        Map<String, dynamic> json) =>
    GetPokemonDetailsDataResponse(
      abilities: (json['abilities'] as List<dynamic>?)
          ?.map((e) => AbilitiesData.fromJson(e))
          .toList(),
      baseExperience: json['base_experience'] as int?,
      id: json['id'] as int?,
      sprites: json['sprites'] == null
          ? null
          : SpritesData.fromJson(json['sprites']),
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => TypesData.fromJson(e))
          .toList(),
      stats: (json['stats'] as List<dynamic>?)
          ?.map((e) => StatsData.fromJson(e))
          .toList(),
      name: json['name'] as String?,
      weight: json['weight'] as int?,
      height: json['height'] as int?,
    );

Map<String, dynamic> _$GetPokemonDetailsDataResponseToJson(
        GetPokemonDetailsDataResponse instance) =>
    <String, dynamic>{
      'abilities': instance.abilities,
      'base_experience': instance.baseExperience,
      'id': instance.id,
      'name': instance.name,
      'sprites': instance.sprites,
      'stats': instance.stats,
      'types': instance.types,
      'weight': instance.weight,
      'height': instance.height,
    };
