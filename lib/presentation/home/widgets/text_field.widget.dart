import 'package:ekko/domain/core/abstractions/presentation/controllers/home/home_controller.interface.dart';
import 'package:ekko/infrastructure/navigation/routes.dart';
import 'package:ekko/presentation/shared/view_controller.interface.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends ViewController<IHomeController> {
  @override
  Widget build(BuildContext context) {
    final controllerText = TextEditingController(text: '');
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: controllerText,
        textAlign: TextAlign.center,
        onSubmitted: (text) {
          Navigator.of(context).pushNamed(
            Routes.details,
            arguments: {'search': text.toLowerCase()},
          );
          FocusScope.of(context).unfocus();
        },
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          labelText: 'Pesquise Aqui',
          labelStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(),
          hoverColor: Colors.white,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
