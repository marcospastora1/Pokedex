import 'package:ekko/domain/pokemon/models/official_artwork.model.dart';
import 'package:ekko/infrastructure/dal/services/data/sprites.data.dart';
import 'package:equatable/equatable.dart';

class OtherModel extends Equatable {
  final OfficialArtworkModel officialArtWork;

  const OtherModel({required this.officialArtWork});

  factory OtherModel.fromData(OtherData data) {
    return OtherModel(
        officialArtWork: OfficialArtworkModel.fromData(data.officialArtWork));
  }

  @override
  List<Object?> get props => [officialArtWork];
}
