import 'package:ekko/domain/pokemon/models/abilities.model.dart';
import 'package:ekko/domain/pokemon/models/infos.model.dart';
import 'package:ekko/domain/pokemon/models/official_artwork.model.dart';
import 'package:ekko/domain/pokemon/models/other.model.dart';
import 'package:ekko/domain/pokemon/models/pokemon_details.model.dart';
import 'package:ekko/domain/pokemon/models/sprites.model.dart';
import 'package:ekko/domain/pokemon/models/stats.model.dart';
import 'package:ekko/domain/pokemon/models/types.model.dart';

const pokemonDetailMock = PokemonDetailsModel(
  abilities: [
    AbilitiesModel(
      ability: AbilityModel(name: 'salto', url: 'url'),
      isHidden: false,
      slot: 1,
    )
  ],
  sprites: SpritesModel(
    other: OtherModel(
      officialArtWork: OfficialArtworkModel(frontDefault: 'frontDefault'),
    ),
  ),
  types: [TypesModel(slot: 1, type: TypeModel(name: 'name', url: 'url'))],
  stats: [
    StatsModel(
      baseStat: 20,
      effort: 0,
      stat: StatModel(name: 'name', url: 'url'),
    ),
  ],
  infos: InfoModel(
    baseExperience: 300,
    id: 1,
    name: 'name',
    weight: 200,
    height: 2,
  ),
);
