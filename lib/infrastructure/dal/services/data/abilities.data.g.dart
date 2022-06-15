// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abilities.data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AbilitiesData _$AbilitiesDataFromJson(Map<String, dynamic> json) =>
    AbilitiesData(
      ability: AbilityData.fromJson(json['ability']),
      isHidden: json['is_hidden'] as bool,
      slot: json['slot'] as int,
    );

Map<String, dynamic> _$AbilitiesDataToJson(AbilitiesData instance) =>
    <String, dynamic>{
      'ability': instance.ability,
      'is_hidden': instance.isHidden,
      'slot': instance.slot,
    };

AbilityData _$AbilityDataFromJson(Map<String, dynamic> json) => AbilityData(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$AbilityDataToJson(AbilityData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
