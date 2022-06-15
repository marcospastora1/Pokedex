import 'package:ekko/domain/pokemon/models/other.model.dart';
import 'package:ekko/infrastructure/dal/services/data/sprites.data.dart';
import 'package:equatable/equatable.dart';

class SpritesModel extends Equatable {
  final OtherModel other;

  const SpritesModel({required this.other});

  factory SpritesModel.fromData(SpritesData data) {
    return SpritesModel(other: OtherModel.fromData(data.other));
  }

  @override
  List<Object?> get props => [other];
}
