import 'package:ekko/domain/core/abstractions/presentation/controllers/details/details_controller.interface.dart';
import 'package:ekko/domain/pokemon/models/infos.model.dart';
import 'package:ekko/domain/pokemon/models/types.model.dart';
import 'package:ekko/presentation/shared/view_controller.interface.dart';
import 'package:flutter/material.dart';

class FotoWidget extends ViewController<IDetailsController> {
  void navBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            StreamBuilder<String?>(
              stream: controller.sprites.errorStream,
              initialData: controller.sprites.value,
              builder: (_, snapshot) {
                return StreamBuilder<List<TypesModel>?>(
                  stream: controller.types.stream,
                  initialData: controller.types.value,
                  builder: (_, snap) {
                    return Container(
                      height: 300,
                      width: double.infinity,
                      child: controller.sprites.value != ''
                          ? Image.network(
                              controller.sprites.value!,
                              scale: 2.33,
                            )
                          : const SizedBox(),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60),
                        ),
                        color: snap.hasData
                            ? snap.data!.isNotEmpty
                                ? snap.data!.first.colorType
                                : Colors.transparent
                            : Colors.transparent,
                      ),
                    );
                  },
                );
              },
            ),
            StreamBuilder<InfoModel?>(
              stream: controller.infos.stream,
              builder: (_, infos) {
                return infos.hasData
                    ? Positioned(
                        top: 50,
                        right: 30,
                        child: Text(
                          '# ${infos.data!.id}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : const SizedBox();
              },
            ),
            Positioned(
              top: 25,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => navBack(context),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Pokedex',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
