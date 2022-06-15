import 'package:ekko/domain/pokemon/models/official_artwork.model.dart';
import 'package:ekko/domain/pokemon/models/other.model.dart';
import 'package:ekko/domain/pokemon/models/sprites.model.dart';

const spritesMock = SpritesModel(
  other: OtherModel(
    officialArtWork: OfficialArtworkModel(frontDefault: 'url'),
  ),
);
