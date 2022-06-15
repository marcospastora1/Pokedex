import 'package:json_annotation/json_annotation.dart';

part 'abilities.data.g.dart';

@JsonSerializable()
class AbilitiesData {
  final AbilityData ability;

  @JsonKey(name: 'is_hidden')
  final bool isHidden;
  final int slot;

  const AbilitiesData({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory AbilitiesData.fromJson(json) => _$AbilitiesDataFromJson(json);

  Map<String, dynamic> toJson() => _$AbilitiesDataToJson(this);
}

@JsonSerializable()
class AbilityData {
  final String name, url;

  const AbilityData({required this.name, required this.url});

  factory AbilityData.fromJson(json) => _$AbilityDataFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityDataToJson(this);
}
