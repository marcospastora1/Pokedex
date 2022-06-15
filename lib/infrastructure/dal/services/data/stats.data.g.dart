// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats.data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatsData _$StatsDataFromJson(Map<String, dynamic> json) => StatsData(
      baseStat: json['base_stat'] as int,
      effort: json['effort'] as int,
      stat: StatData.fromJson(json['stat']),
    );

Map<String, dynamic> _$StatsDataToJson(StatsData instance) => <String, dynamic>{
      'base_stat': instance.baseStat,
      'effort': instance.effort,
      'stat': instance.stat,
    };

StatData _$StatDataFromJson(Map<String, dynamic> json) => StatData(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$StatDataToJson(StatData instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
