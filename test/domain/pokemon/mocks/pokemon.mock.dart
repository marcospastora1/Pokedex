import 'package:ekko/infrastructure/dal/services/data/abilities.data.dart';
import 'package:ekko/infrastructure/dal/services/data/pokemon.data.dart';
import 'package:ekko/infrastructure/dal/services/data/sprites.data.dart';
import 'package:ekko/infrastructure/dal/services/data/stats.data.dart';
import 'package:ekko/infrastructure/dal/services/data/types.data.dart';
import 'package:ekko/infrastructure/dal/services/pokemon/dto/get_pokemon_details.response.dart';

const successPokemonData = [PokemonData(name: 'name', url: 'url')];

const successPokemonDetailsData = GetPokemonDetailsDataResponse(
  abilities: [
    AbilitiesData(
      ability: AbilityData(name: 'name', url: 'url'),
      isHidden: false,
      slot: 1,
    ),
  ],
  baseExperience: 300,
  id: 1,
  sprites: SpritesData(
    other: OtherData(
      officialArtWork: OfficialArtworkData(frontDefault: 'frontDefault'),
    ),
  ),
  types: [TypesData(slot: 1, type: TypeData(name: 'name', url: 'url'))],
  stats: [
    StatsData(
      baseStat: 1,
      effort: 1,
      stat: StatData(name: 'name', url: 'url'),
    ),
  ],
  name: 'name',
  weight: 60,
  height: 2,
);
