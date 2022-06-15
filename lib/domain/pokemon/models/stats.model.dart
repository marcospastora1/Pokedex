import 'package:ekko/infrastructure/dal/services/data/stats.data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class StatsModel extends Equatable {
  final int baseStat;
  final int effort;
  final StatModel stat;

  const StatsModel({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  Color get colorStats {
    switch (stat.name) {
      case 'hp':
        return Colors.red;
      case 'attack':
        return Colors.yellow;
      case 'defense':
        return Colors.blue;
      case 'special-attack':
        return Colors.grey;
      case 'special-defense':
        return Colors.green;
      case 'speed':
        return Colors.purple;
      default:
        return Colors.transparent;
    }
  }

  String get abeviacao {
    switch (stat.name) {
      case 'hp':
        return 'HP';
      case 'attack':
        return 'ATK';
      case 'defense':
        return 'DEF';
      case 'special-attack':
        return 'SATK';
      case 'special-defense':
        return 'SDEF';
      case 'speed':
        return 'SPD';
      default:
        return '';
    }
  }

  factory StatsModel.fromData(StatsData data) {
    return StatsModel(
      baseStat: data.baseStat,
      effort: data.effort,
      stat: StatModel.fromData(data.stat),
    );
  }

  @override
  List<Object?> get props => [baseStat, effort, stat];
}

class StatModel extends Equatable {
  final String name;
  final String url;

  const StatModel({required this.name, required this.url});

  factory StatModel.fromData(StatData data) {
    return StatModel(name: data.name, url: data.url);
  }

  @override
  List<Object?> get props => [name, url];
}
