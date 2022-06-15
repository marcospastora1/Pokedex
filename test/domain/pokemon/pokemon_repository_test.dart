import 'package:ekko/domain/core/abstractions/domain/repositories/pokemon_repository.interface.dart';
import 'package:ekko/domain/core/abstractions/infrastructure/services/pokemon.service.interface.dart';
import 'package:ekko/domain/pokemon/models/pokemon.model.dart';
import 'package:ekko/domain/pokemon/models/pokemon_details.model.dart';
import 'package:ekko/domain/pokemon/pokemon.repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';
import 'mocks/pokemon.mock.dart';

void main() {
  late IPokemonRepository pokemonRepository;
  late IPokemonService pokemonService;

  setUpAll(() {
    pokemonService = PokemonServiceMock();
    pokemonRepository = PokemonRepository(pokemonService);
  });

  test(
    'Should load pokemons with success',
    () async {
      when(() => pokemonService.getPokemons()).thenAnswer(
        (_) async => successPokemonData,
      );

      final response = await pokemonRepository.getPokemons();
      final model =
          successPokemonData.map((e) => PokemonModel.fromData(e)).toList();

      expect(response, model);
    },
  );

  test('Should load sprites with success', () async {
    const name = 'bulbasauro';

    when(() => pokemonService.getPokemonsDetails(name: name)).thenAnswer(
      (_) async => successPokemonDetailsData,
    );

    final response = await pokemonRepository.getPokemonDetails(name: name);
    final model = PokemonDetailsModel.fromData(successPokemonDetailsData);

    expect(response, model);
  });
}
