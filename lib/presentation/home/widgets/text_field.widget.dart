import 'package:ekko/domain/core/abstractions/presentation/controllers/home/home_controller.interface.dart';
import 'package:ekko/infrastructure/navigation/routes.dart';
import 'package:ekko/presentation/shared/view_controller.interface.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends ViewController<IHomeController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        textAlign: TextAlign.center,
        onSubmitted: (text) {
          Navigator.of(context).pushNamed(
            Routes.details,
            arguments: {'search': text},
          );
        },
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: const InputDecoration(
          labelText: 'Pesquise Aqui',
          border: OutlineInputBorder(),
          hoverColor: Colors.white,
        ),
      ),
    );
  }
}
