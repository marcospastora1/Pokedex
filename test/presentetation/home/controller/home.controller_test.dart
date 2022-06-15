import 'package:ekko/domain/core/abstractions/domain/repositories/pokemon_repository.interface.dart';
import 'package:ekko/domain/core/abstractions/presentation/controllers/home/home_controller.interface.dart';
import 'package:ekko/domain/core/exceptions/default.exception.dart';
import 'package:ekko/domain/pokemon/models/pokemon.mock.dart';
import 'package:ekko/domain/pokemon/models/pokemon_details.mock.dart';
import 'package:ekko/infrastructure/navigation/bindings/controllers/home.controller.binding.dart';
import 'package:ekko/presentation/home/controller/home.controller.dart';
import 'package:ekko/presentation/shared/loading/loading.controller.dart';
import 'package:ekko/presentation/shared/loading/loading.interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  late IHomeController homeController;
  late IPokemonRepository pokemonRepository;
  late ILoadingController loading;

  setUp(() {
    pokemonRepository = PokemonRepositoryMock();
    loading = LoadingController();
    homeController = HomeController(
      pokemonRepository: pokemonRepository,
      pokemons: makePokemonField(),
      loading: loading,
      sprites: makeSprites(),
    );
  });

  group(
    'Load pokemons',
    () {
      test('Should load pokemons with success', () async {
        final onError = CallBackMock<String>();

        when(() => pokemonRepository.getPokemons())
            .thenAnswer((_) async => listPokemonModel);

        await homeController.loadPokemons(onError: onError);

        expect(homeController.pokemons.value, listPokemonModel);
      });

      test('Should load pokemons with error', () async {
        final onError = CallBackMock<String>();

        final err = DefaultException(message: 'Falha ao carregar pokemons');

        when(() => pokemonRepository.getPokemons()).thenThrow(err);

        await homeController.loadPokemons(onError: onError);

        verify(() => onError(err.toString()));
      });
    },
  );

  group(
    'Load sprites',
    () {
      test('Should load sprites with success', () async {
        final onError = CallBackMock<String>();
        const name = 'bulbasaur';

        when(() => pokemonRepository.getPokemonDetails(name: name))
            .thenAnswer((_) async => pokemonDetailMock);

        await homeController.loadSprites(name: name, onError: onError);

        expect(
          homeController.sprites.value,
          pokemonDetailMock.sprites,
        );
      });

      test(
        'Should load sprites with default exception',
        () async {
          final onError = CallBackMock<String>();
          const name = 'bulbasaur';

          final err = DefaultException(message: 'Falha ao pegar Sprites');

          when(() => pokemonRepository.getPokemonDetails(name: name))
              .thenThrow(err);

          await homeController.loadSprites(name: name, onError: onError);

          verify(() => onError(err.toString()));
        },
      );
    },
  );
}
