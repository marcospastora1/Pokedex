import 'package:ekko/domain/core/abstractions/presentation/controllers/details/details_controller.interface.dart';
import 'package:ekko/domain/pokemon/models/types.model.dart';
import 'package:ekko/presentation/shared/view_controller.interface.dart';
import 'package:flutter/material.dart';

class TypeWidget extends ViewController<IDetailsController> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TypesModel>?>(
      stream: controller.types.stream,
      builder: (_, snapshot) {
        return SizedBox(
          height: 30,
          child: Center(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.hasData ? snapshot.data!.length : 0,
              separatorBuilder: (_, __) => const SizedBox(width: 50),
              itemBuilder: (_, index) {
                return _ItemTypeWidget(
                  type: snapshot.data![index].type.name,
                  color: snapshot.data![index].colorType,
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class _ItemTypeWidget extends StatelessWidget {
  final String type;
  final Color color;

  const _ItemTypeWidget({required this.type, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      width: 125,
      child: Center(
        child: Text(type, style: const TextStyle(color: Colors.white)),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
    );
  }
}
