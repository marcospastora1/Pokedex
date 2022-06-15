import 'package:ekko/infrastructure/dal/services/data/sprites.data.dart';
import 'package:equatable/equatable.dart';

class OfficialArtworkModel extends Equatable {
  final String frontDefault;

  const OfficialArtworkModel({required this.frontDefault});

  factory OfficialArtworkModel.fromData(OfficialArtworkData data) {
    return OfficialArtworkModel(frontDefault: data.frontDefault);
  }

  @override
  List<Object?> get props => [frontDefault];
}
