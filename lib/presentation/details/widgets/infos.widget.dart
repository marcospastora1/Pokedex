import 'package:ekko/domain/core/abstractions/presentation/controllers/details/details_controller.interface.dart';
import 'package:ekko/domain/pokemon/models/infos.model.dart';
import 'package:ekko/presentation/shared/view_controller.interface.dart';
import 'package:flutter/material.dart';

class InfosWidget extends ViewController<IDetailsController> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<InfoModel?>(
      stream: controller.infos.stream,
      builder: (_, snapshot) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  snapshot.hasData ? '${snapshot.data!.weight / 10} KG' : '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Weight',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  snapshot.hasData
                      ? '${controller.infos.value!.height / 10} M'
                      : '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Height',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            )
          ],
        );
      },
    );
  }
}
