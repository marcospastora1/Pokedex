import 'package:ekko/domain/core/abstractions/infrastructure/http_connect.interface.dart';
import 'package:ekko/domain/core/abstractions/infrastructure/services/pokemon.service.interface.dart';
import 'package:ekko/domain/core/exceptions/default.exception.dart';
import 'package:ekko/infrastructure/dal/services/pokemon/pokemon.service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import 'mocks/pokemon_mocks/pokemons_mocks.dart';

void main() {
  late IHttpConnect connect;
  late IPokemonService pokemonService;

  setUpAll(() {
    connect = ConnectMock();
    pokemonService = PokemonService(connect);
  });

  group('Get pokemons', () {
    const url = '/pokemon/?offset=0&limit=10228';

    test(
      'Should return pokemons with success',
      () async {
        when(() => connect.get(url, decoder: any(named: 'decoder')))
            .thenAnswer((_) async => successPokemonResponse);

        final response = await pokemonService.getPokemons();
        expect(response, successPokemonResponse.payload!.results!);
      },
    );

    test(
      'Should return pokemons with default exception',
      () async {
        when(
          () => connect.get(url, decoder: any(named: 'decoder')),
        ).thenAnswer((_) async => errorPokemonResponse);

        final future = pokemonService.getPokemons();
        expect(future, throwsA(isA<DefaultException>()));
      },
    );
  });

  group('Should return pokemon details', () {
    const name = 'bulbasaur';
    const url = 'pokemon/$name';
    test(
      'Should return pokemon details with success',
      () async {
        when(
          () => connect.get(url, decoder: any(named: 'decoder')),
        ).thenAnswer((_) async => successPokemonDetailsResponse);

        final response = await pokemonService.getPokemonsDetails(name: name);

        expect(response, successPokemonDetailsResponse.payload!);
      },
    );

    test(
      'Should return sprites with default exception',
      () async {
        when(
          () => connect.get(url, decoder: any(named: 'decoder')),
        ).thenAnswer((_) async => errorPokemonDetailsResponse);

        final future = pokemonService.getPokemonsDetails(name: name);

        expect(future, throwsA(isA<DefaultException>()));
      },
    );
  });
}
