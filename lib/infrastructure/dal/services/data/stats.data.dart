import 'package:json_annotation/json_annotation.dart';

part 'stats.data.g.dart';

@JsonSerializable()
class StatsData {
  @JsonKey(name: 'base_stat')
  final int baseStat;
  final int effort;
  final StatData stat;

  const StatsData({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory StatsData.fromJson(json) => _$StatsDataFromJson(json);

  Map<String, dynamic> toJson() => _$StatsDataToJson(this);
}

@JsonSerializable()
class StatData {
  final String name;
  final String url;

  const StatData({required this.name, required this.url});

  factory StatData.fromJson(json) => _$StatDataFromJson(json);

  Map<String, dynamic> toJson() => _$StatDataToJson(this);
}
