import 'package:ekko/infrastructure/dal/services/data/pokemon.data.dart';
import 'package:equatable/equatable.dart';

class PokemonModel extends Equatable {
  final String name, url;

  const PokemonModel({required this.name, required this.url});

  factory PokemonModel.fromData(PokemonData data) {
    return PokemonModel(name: data.name, url: data.url);
  }

  @override
  List<Object?> get props => [name, url];
}
