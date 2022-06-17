import 'package:ekko/domain/core/abstractions/presentation/controllers/details/details_controller.interface.dart';
import 'package:ekko/domain/core/models/callback.model.dart';
import 'package:ekko/domain/core/utils/snackbar.util.dart';
import 'package:ekko/domain/pokemon/models/infos.model.dart';
import 'package:ekko/infrastructure/dal/inject.dart';
import 'package:ekko/presentation/details/widgets/foto.widget.dart';
import 'package:ekko/presentation/details/widgets/infos.widget.dart';
import 'package:ekko/presentation/details/widgets/stats.widget.dart';
import 'package:ekko/presentation/details/widgets/type.widget.dart';
import 'package:ekko/presentation/shared/loading/loading.widget.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DetailsScreen();
}

class _DetailsScreen extends State<DetailsScreen> {
  final controller = Inject.find<IDetailsController>();

  @override
  void initState() {
    final onError = CallBack<String>(
      (err) => SnackbarUtil.showError(err!),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadPokemonDetails(onError: onError);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 43, 40, 40),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FotoWidget(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Column(
                  children: [
                    StreamBuilder<InfoModel?>(
                      stream: controller.infos.stream,
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.hasData ? snapshot.data!.name : '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    TypeWidget(),
                    const SizedBox(height: 30),
                    InfosWidget(),
                    const SizedBox(height: 30),
                    StatsWidget(),
                    const SizedBox(height: 30)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
