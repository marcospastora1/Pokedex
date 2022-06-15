// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sprites.data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpritesData _$SpritesDataFromJson(Map<String, dynamic> json) => SpritesData(
      other: OtherData.fromJson(json['other']),
    );

Map<String, dynamic> _$SpritesDataToJson(SpritesData instance) =>
    <String, dynamic>{
      'other': instance.other,
    };

OtherData _$OtherDataFromJson(Map<String, dynamic> json) => OtherData(
      officialArtWork: OfficialArtworkData.fromJson(json['official-artwork']),
    );

Map<String, dynamic> _$OtherDataToJson(OtherData instance) => <String, dynamic>{
      'official-artwork': instance.officialArtWork,
    };

OfficialArtworkData _$OfficialArtworkDataFromJson(Map<String, dynamic> json) =>
    OfficialArtworkData(
      frontDefault: json['front_default'] as String,
    );

Map<String, dynamic> _$OfficialArtworkDataToJson(
        OfficialArtworkData instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
    };
