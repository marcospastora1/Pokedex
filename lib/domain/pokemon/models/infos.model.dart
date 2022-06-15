import 'package:ekko/infrastructure/dal/services/pokemon/dto/get_pokemon_details.response.dart';
import 'package:equatable/equatable.dart';

class InfoModel extends Equatable {
  final int baseExperience;
  final int id;
  final String name;
  final int weight;
  final int height;

  const InfoModel({
    required this.baseExperience,
    required this.id,
    required this.name,
    required this.weight,
    required this.height,
  });

  factory InfoModel.fromData(GetPokemonDetailsDataResponse data) {
    return InfoModel(
      baseExperience: data.baseExperience!,
      id: data.id!,
      name: data.name!,
      weight: data.weight!,
      height: data.height!,
    );
  }

  @override
  List<Object?> get props => [id, name, baseExperience, weight];
}
