import 'package:ekko/infrastructure/dal/services/data/abilities.data.dart';
import 'package:equatable/equatable.dart';

class AbilitiesModel extends Equatable {
  final AbilityModel ability;
  final bool isHidden;
  final int slot;

  const AbilitiesModel({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory AbilitiesModel.fromData(AbilitiesData data) {
    return AbilitiesModel(
      ability: AbilityModel.fromData(data.ability),
      isHidden: data.isHidden,
      slot: data.slot,
    );
  }

  @override
  List<Object?> get props => [ability, isHidden, slot];
}

class AbilityModel extends Equatable {
  final String name, url;

  const AbilityModel({required this.name, required this.url});

  factory AbilityModel.fromData(AbilityData data) {
    return AbilityModel(name: data.name, url: data.url);
  }

  @override
  List<Object?> get props => [name, url];
}
