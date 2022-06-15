// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types.data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypesData _$TypesDataFromJson(Map<String, dynamic> json) => TypesData(
      slot: json['slot'] as int,
      type: TypeData.fromJson(json['type']),
    );

Map<String, dynamic> _$TypesDataToJson(TypesData instance) => <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };

TypeData _$TypeDataFromJson(Map<String, dynamic> json) => TypeData(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$TypeDataToJson(TypeData instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
