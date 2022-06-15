// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info.data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoData _$InfoDataFromJson(Map<String, dynamic> json) => InfoData(
      baseExperience: json['base_expericence'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      weight: json['weight'] as int,
    );

Map<String, dynamic> _$InfoDataToJson(InfoData instance) => <String, dynamic>{
      'base_expericence': instance.baseExperience,
      'id': instance.id,
      'name': instance.name,
      'weight': instance.weight,
    };
