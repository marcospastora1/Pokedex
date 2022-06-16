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
            child: _ItemTypeWidget(
              type: snapshot.hasData ? snapshot.data! : [],
            ),
          ),
        );
      },
    );
  }
}

class _ItemTypeWidget extends StatelessWidget {
  final List? type;

  const _ItemTypeWidget({required this.type});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: type!.length > 1
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.center,
      children: [
        Container(
          width: 125,
          child: Center(
            child: Text(
              type != null
                  ? type!.isNotEmpty
                      ? type!.first.type.name
                      : ''
                  : '',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: type != null
                ? type!.isNotEmpty
                    ? type!.first.colorType
                    : Colors.transparent
                : Colors.transparent,
          ),
        ),
        Visibility(
          visible: type != null ? type!.length > 1 : false,
          child: Container(
            width: 125,
            child: Center(
              child: Text(
                type != null
                    ? type!.isNotEmpty
                        ? type!.last.type.name
                        : ''
                    : '',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: type != null
                  ? type!.isNotEmpty
                      ? type!.last.colorType
                      : Colors.transparent
                  : Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}
