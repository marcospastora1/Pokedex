import 'package:ekko/domain/core/abstractions/presentation/controllers/home/home_controller.interface.dart';
import 'package:ekko/domain/core/models/callback.model.dart';
import 'package:ekko/domain/core/utils/snackbar.util.dart';
import 'package:ekko/domain/pokemon/models/pokemon.model.dart';
import 'package:ekko/domain/pokemon/models/sprites.model.dart';
import 'package:ekko/infrastructure/navigation/routes.dart';
import 'package:ekko/presentation/shared/view_controller.interface.dart';
import 'package:flutter/material.dart';

class GridWidget extends ViewController<IHomeController> {
  final onError = CallBack<String>(
    (err) => SnackbarUtil.showError(err!),
  );

  void navDetails(BuildContext context, int index) {
    Navigator.of(context).pushNamed(
      Routes.details,
      arguments: {'pokemon': controller.pokemons.value![index]},
    );
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: controller.pokemons.value!.length,
      itemBuilder: (_, index) {
        return _PokemonWidget(
          pokemon: controller.pokemons.value!,
          index: index,
          sprite: controller.sprites.value,
          onTap: () => navDetails(context, index),
        );
      },
    );
  }
}

class _PokemonWidget extends StatelessWidget {
  final List<PokemonModel> pokemon;
  final int index;
  final SpritesModel? sprite;
  final VoidCallback onTap;

  const _PokemonWidget({
    required this.pokemon,
    required this.index,
    required this.sprite,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.redAccent.withAlpha(100),
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
        child: Stack(
          children: [
            Image.network(
              sprite != null
                  ? sprite!.other.officialArtWork.frontDefault
                  : 'https://imagensemoldes.com.br/wp-content/uploads/2020/04/Logo-Pokebola-Pok%C3%A9mon-PNG.png',
              fit: BoxFit.fill,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                pokemon[index].name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(),
          color: Colors.grey.shade500,
        ),
      ),
    );
  }
}
