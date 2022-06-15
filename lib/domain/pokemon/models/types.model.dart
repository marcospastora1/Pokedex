import 'package:ekko/infrastructure/dal/services/data/types.data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TypesModel extends Equatable {
  final int slot;
  final TypeModel type;

  const TypesModel({required this.slot, required this.type});

  Color get colorType {
    switch (type.name) {
      case 'bug':
        return const Color.fromARGB(255, 156, 225, 160);
      case 'bark':
        return Colors.brown;
      case 'dragon':
        return Colors.purple;
      case 'electric':
        return const Color.fromARGB(102, 255, 193, 7);
      case 'fairy':
        return Colors.pink.shade100;
      case 'fighting':
        return const Color.fromARGB(255, 124, 16, 48);
      case 'fire':
        return Colors.orange;
      case 'flying':
        return Colors.blue.shade200;
      case 'ghost':
        return Colors.blue.shade900;
      case 'grass':
        return const Color.fromARGB(255, 84, 152, 87);
      case 'ground':
        return const Color.fromARGB(255, 237, 185, 102);
      case 'ice':
        return Colors.blueAccent.shade100;
      case 'normal':
        return Colors.grey.shade400;
      case 'poison':
        return const Color.fromARGB(134, 133, 70, 209);
      case 'psychic':
        return Colors.pink.shade700;
      case 'rock':
        return const Color.fromARGB(255, 96, 67, 20);
      case 'steel':
        return Colors.grey.shade700;
      case 'water':
        return const Color.fromARGB(255, 59, 124, 222);
      default:
        return Colors.white;
    }
  }

  factory TypesModel.fromData(TypesData data) {
    return TypesModel(slot: data.slot, type: TypeModel.fromData(data.type));
  }

  @override
  List<Object?> get props => [slot, type];
}

class TypeModel extends Equatable {
  final String name, url;

  const TypeModel({required this.name, required this.url});

  factory TypeModel.fromData(TypeData data) {
    return TypeModel(name: data.name, url: data.url);
  }

  @override
  List<Object?> get props => [name, url];
}
