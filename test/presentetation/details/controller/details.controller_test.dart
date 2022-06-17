import 'package:ekko/domain/core/abstractions/domain/repositories/pokemon_repository.interface.dart';
import 'package:ekko/domain/core/abstractions/presentation/controllers/details/details_controller.interface.dart';
import 'package:ekko/domain/core/exceptions/default.exception.dart';
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
      pokemon: const PokemonModel(name: 'bulbasaur', url: 'url'),
      search: 'bulbasaur',
    );
  });

  test('Should load pokemon details with success', () async {
    final onError = CallBackMock<String>();
    when(
      () => pokemonRepository.getPokemonDetails(
        name: detailsController.pokemon?.name ?? detailsController.search!,
      ),
    ).thenAnswer((_) async => pokemonDetailMock);

    await detailsController.loadPokemonDetails(onError: onError);

    verify(
      () => pokemonRepository.getPokemonDetails(
        name: detailsController.pokemon?.name ?? detailsController.search!,
      ),
    );

    expect(
      detailsController.sprites.value,
      pokemonDetailMock.sprites.other.officialArtWork.frontDefault,
    );

    expect(detailsController.infos.value, pokemonDetailMock.infos);
    expect(detailsController.stats.value, pokemonDetailMock.stats);
    expect(detailsController.types.value, pokemonDetailMock.types);
  });

  test('Should load pokemon details with error', () async {
    final onError = CallBackMock<String>();
    final err = DefaultException(
      message: 'Tente escrever o nome do pokemon em inglês',
    );

    when(() => pokemonRepository.getPokemonDetails(
            name: detailsController.pokemon?.name ?? detailsController.search!))
        .thenThrow(err);

    await detailsController.loadPokemonDetails(onError: onError);

    verify(() => onError(err.toString()));
  });
}
