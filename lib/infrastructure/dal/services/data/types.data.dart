import 'package:json_annotation/json_annotation.dart';

part 'types.data.g.dart';

@JsonSerializable()
class TypesData {
  final int slot;
  final TypeData type;

  const TypesData({required this.slot, required this.type});

  factory TypesData.fromJson(json) => _$TypesDataFromJson(json);

  Map<String, dynamic> toJson() => _$TypesDataToJson(this);
}

@JsonSerializable()
class TypeData {
  final String name, url;

  const TypeData({required this.name, required this.url});

  factory TypeData.fromJson(json) => _$TypeDataFromJson(json);

  Map<String, dynamic> toJson() => _$TypeDataToJson(this);
}
