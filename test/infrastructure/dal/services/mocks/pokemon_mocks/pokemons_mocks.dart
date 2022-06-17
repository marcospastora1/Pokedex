import 'package:ekko/domain/core/abstractions/infrastructure/response.model.dart';
import 'package:ekko/infrastructure/dal/services/data/abilities.data.dart';
import 'package:ekko/infrastructure/dal/services/data/pokemon.data.dart';
import 'package:ekko/infrastructure/dal/services/data/sprites.data.dart';
import 'package:ekko/infrastructure/dal/services/data/stats.data.dart';
import 'package:ekko/infrastructure/dal/services/data/types.data.dart';
import 'package:ekko/infrastructure/dal/services/pokemon/dto/get_pokemon.response.dart';
import 'package:ekko/infrastructure/dal/services/pokemon/dto/get_pokemon_details.response.dart';

const successPokemonResponse = Response(
  statusCode: 200,
  payload: GetPokemonResponse(
    results: [PokemonData(name: 'Charmander', url: 'url')],
  ),
);

const errorPokemonResponse = Response(
  statusCode: 400,
  payload: GetPokemonResponse(
    results: null,
  ),
);

const successPokemonDetailsResponse = Response(
  statusCode: 200,
  payload: GetPokemonDetailsDataResponse(
    abilities: [
      AbilitiesData(
        ability: AbilityData(name: 'Salto Mortal', url: 'url'),
        isHidden: false,
        slot: 1,
      ),
    ],
    baseExperience: 100,
    id: 1,
    sprites: SpritesData(
      other: OtherData(
        officialArtWork: OfficialArtworkData(frontDefault: 'frontDefault'),
      ),
    ),
    types: [TypesData(slot: 1, type: TypeData(name: 'grama', url: 'url'))],
    stats: [
      StatsData(
        baseStat: 100,
        effort: 10,
        stat: StatData(name: 'name', url: 'url'),
      )
    ],
    name: 'Charmander',
    weight: 100,
    height: 2,
  ),
);

const errorPokemonDetailsResponse = Response(
  statusCode: 400,
  payload: GetPokemonDetailsDataResponse(
    abilities: null,
    baseExperience: null,
    id: null,
    sprites: null,
    types: null,
    stats: null,
    name: null,
    weight: null,
    height: null,
  ),
);
