import 'package:ekko/domain/core/abstractions/presentation/controllers/home/home_controller.interface.dart';
import 'package:ekko/domain/core/models/callback.model.dart';
import 'package:ekko/domain/core/utils/snackbar.util.dart';
import 'package:ekko/infrastructure/dal/inject.dart';
import 'package:ekko/presentation/home/widgets/grid.widget.dart';
import 'package:ekko/presentation/home/widgets/text_field.widget.dart';
import 'package:ekko/presentation/shared/loading/loading.widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Inject.find<IHomeController>();

  @override
  void initState() {
    super.initState();
    final onError = CallBack<String>(
      (err) => SnackbarUtil.showError(err!),
    );
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => controller.loadPokemons(onError: onError),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
      child: StreamBuilder(
        stream: controller.pokemons.stream,
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 43, 40, 40),
            appBar: AppBar(
              title: const Text('Pokedex'),
              backgroundColor: Colors.red,
            ),
            body: Column(
              children: [
                TextFieldWidget(),
                Expanded(child: GridWidget()),
              ],
            ),
          );
        },
      ),
    );
  }
}
