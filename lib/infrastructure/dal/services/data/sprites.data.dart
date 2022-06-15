import 'package:json_annotation/json_annotation.dart';

part 'sprites.data.g.dart';

@JsonSerializable()
class SpritesData {
  final OtherData other;

  const SpritesData({required this.other});

  factory SpritesData.fromJson(json) => _$SpritesDataFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesDataToJson(this);
}

@JsonSerializable()
class OtherData {
  @JsonKey(name: 'official-artwork')
  final OfficialArtworkData officialArtWork;

  const OtherData({required this.officialArtWork});

  factory OtherData.fromJson(json) => _$OtherDataFromJson(json);

  Map<String, dynamic> toJson() => _$OtherDataToJson(this);
}


@JsonSerializable()
class OfficialArtworkData {
  @JsonKey(name: 'front_default')
  final String frontDefault;

  const OfficialArtworkData({required this.frontDefault});

  factory OfficialArtworkData.fromJson(json) =>
      _$OfficialArtworkDataFromJson(json);

  Map<String, dynamic> toJson() => _$OfficialArtworkDataToJson(this);
}
