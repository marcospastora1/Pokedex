import 'package:ekko/domain/core/abstractions/domain/repositories/pokemon_repository.interface.dart';
import 'package:ekko/domain/core/abstractions/presentation/controllers/details/details_controller.interface.dart';
import 'package:ekko/domain/pokemon/models/pokemon.model.dart';
import 'package:ekko/domain/pokemon/models/pokemon_details.mock.dart';
import 'package:ekko/infrastructure/navigation/bindings/controllers/detais.controller.binding.dart';
import 'package:ekko/presentation/details/controller/details.controller.dart';
import 'package:ekko/presentation/shared/loading/loading.interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  late IDetailsController detailsController;
  late IPokemonRepository pokemonRepository;
  late ILoadingController loading;

  setUp(() {
    pokemonRepository = PokemonRepositoryMock();
    loading = LoadingControllerMock();
    detailsController = DetailsController(
      pokemonRepository: pokemonRepository,
      loading: loading,
      sprites: makeSprites(),
      infos: makeInfos(),
      stats: makeStats(),
      types: makeTypes(),
      pokemon: const PokemonModel(name: 'Bulbasauro', url: 'url'),
    );
  });

  test(
    'Should load sprites with success',
    () async {
      when(
        () => pokemonRepository.getPokemonDetails(
          name: detailsController.pokemon.name,
        ),
      ).thenAnswer((_) async => pokemonDetailMock);

      await detailsController.loadSprites();

      verify(
        () => pokemonRepository.getPokemonDetails(
          name: detailsController.pokemon.name,
        ),
      );

      expect(
        detailsController.sprites.value,
        pokemonDetailMock.sprites.other.officialArtWork.frontDefault,
      );
    },
  );

  test('Shoul load types with success', () async {
    when(
      () => pokemonRepository.getPokemonDetails(
        name: detailsController.pokemon.name,
      ),
    ).thenAnswer((_) async => pokemonDetailMock);

    await detailsController.loadTypes();

    verify(
      () => pokemonRepository.getPokemonDetails(
        name: detailsController.pokemon.name,
      ),
    );

    expect(detailsController.types.value, pokemonDetailMock.types);
  });

  test('Shoul load stats with success', () async {
    when(
      () => pokemonRepository.getPokemonDetails(
        name: detailsController.pokemon.name,
      ),
    ).thenAnswer((_) async => pokemonDetailMock);

    await detailsController.loadStats();

    verify(
      () => pokemonRepository.getPokemonDetails(
        name: detailsController.pokemon.name,
      ),
    );

    expect(detailsController.stats.value, pokemonDetailMock.stats);
  });

  test('Shoul load infos with success', () async {
    when(
      () => pokemonRepository.getPokemonDetails(
        name: detailsController.pokemon.name,
      ),
    ).thenAnswer((_) async => pokemonDetailMock);

    await detailsController.loadInfos();

    verify(
      () => pokemonRepository.getPokemonDetails(
        name: detailsController.pokemon.name,
      ),
    );

    expect(detailsController.infos.value, pokemonDetailMock.infos);
  });
}
