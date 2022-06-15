import 'package:ekko/domain/core/abstractions/presentation/controllers/details/details_controller.interface.dart';
import 'package:ekko/domain/pokemon/models/stats.model.dart';
import 'package:ekko/presentation/shared/view_controller.interface.dart';
import 'package:flutter/material.dart';

class StatsWidget extends ViewController<IDetailsController> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<StatsModel>?>(
      stream: controller.stats.stream,
      builder: (_, snapshot) {
        return Column(
          children: [
            const Text(
              'Base Stats',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  snapshot.hasData
                      ? snapshot.data!.isNotEmpty
                          ? snapshot.data![0].abeviacao
                          : ''
                      : '',
                  style: const TextStyle(color: Colors.white),
                ),
                _StatsBar(
                  stat: snapshot.hasData
                      ? snapshot.data!.isNotEmpty
                          ? snapshot.data![0].baseStat * 2
                          : 0
                      : 0,
                  color: snapshot.hasData
                      ? snapshot.data!.isNotEmpty
                          ? snapshot.data![0].colorStats
                          : Colors.transparent
                      : Colors.transparent,
                  valor: snapshot.hasData
                      ? snapshot.data!.isNotEmpty
                          ? snapshot.data![0].baseStat.toString()
                          : ''
                      : '',
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  snapshot.hasData
                      ? snapshot.data!.isNotEmpty
                          ? snapshot.data![1].abeviacao
                          : ''
                      : '',
                  style: const TextStyle(color: Colors.white),
                ),
                _StatsBar(
                  stat: snapshot.hasData
                      ? snapshot.data!.isNotEmpty
                          ? snapshot.data![1].baseStat * 2
                          : 0
                      : 0,
                  color: snapshot.hasData
                      ? snapshot.data!.isNotEmpty
                          ? snapshot.data![1].colorStats
                          : Colors.transparent
                      : Colors.transparent,
                  valor: snapshot.hasData
                      ? snapshot.data!.isNotEmpty
                          ? snapshot.data![1].baseStat.toString()
                          : ''
                      : '',
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  snapshot.hasData
                      ? snapshot.data!.isNotEmpty
                          ? snapshot.data![2].abeviacao
                          : ''
                      : '',
                  style: const TextStyle(color: Colors.white),
                ),
                _StatsBar(
                  stat: snapshot.hasData
                      ? snapshot.data!.isNotEmpty
                          ? snapshot.data![2].baseStat * 2
                          : 0
                      : 0,
                  color: snapshot.hasData
                      ? snapshot.data!.isNotEmpty
                          ? snapshot.data![2].colorStats
                          : Colors.transparent
                      : Colors.transparent,
                  valor: snapshot.hasData
                      ? snapshot.data!.isNotEmpty
                          ? snapshot.data![2].baseStat.toString()
                          : ''
                      : '',
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  snapshot.hasData
                      ? snapshot.data!.isNotEmpty
                          ? snapshot.data![3].abeviacao
                          : ''
                      : '',
                  style: const TextStyle(color: Colors.white),
                ),
                _StatsBar(
                  stat: snapshot.hasData
                      ? snapshot.data!.isNotEmpty
                          ? snapshot.data![3].baseStat * 2
                          : 0
                      : 0,
                  color: snapshot.hasData
                      ? snapshot.data!.isNotEmpty
                          ? snapshot.data![3].colorStats
                          : Colors.transparent
                      : Colors.transparent,
                  valor: snapshot.hasData
                      ? snapshot.data!.isNotEmpty
                          ? snapshot.data![3].baseStat.toString()
                          : ''
                      : '',
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  snapshot.hasData
                      ? snapshot.data!.isNotEmpty
                          ? snapshot.data![4].abeviacao
                          : ''
                      : '',
                  style: const TextStyle(color: Colors.white),
                ),
                _StatsBar(
                  stat: snapshot.hasData
                      ? snapshot.data!.isNotEmpty
                          ? snapshot.data![4].baseStat * 2
                          : 0
                      : 0,
                  color: snapshot.hasData
                      ? snapshot.data!.isNotEmpty
                          ? snapshot.data![4].colorStats
                          : Colors.transparent
                      : Colors.transparent,
                  valor: snapshot.hasData
                      ? snapshot.data!.isNotEmpty
                          ? snapshot.data![4].baseStat.toString()
                          : ''
                      : '',
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  snapshot.hasData
                      ? snapshot.data!.isNotEmpty
                          ? snapshot.data![5].abeviacao
                          : ''
                      : '',
                  style: const TextStyle(color: Colors.white),
                ),
                _StatsBar(
                  stat: snapshot.hasData
                      ? snapshot.data!.isNotEmpty
                          ? snapshot.data![5].baseStat * 2
                          : 0
                      : 0,
                  color: snapshot.hasData
                      ? snapshot.data!.isNotEmpty
                          ? snapshot.data![5].colorStats
                          : Colors.transparent
                      : Colors.transparent,
                  valor: snapshot.hasData
                      ? snapshot.data!.isNotEmpty
                          ? snapshot.data![5].baseStat.toString()
                          : ''
                      : '',
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _StatsBar extends StatelessWidget {
  final double stat;
  final Color color;
  final String valor;

  const _StatsBar({
    required this.stat,
    required this.color,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 200,
          height: 15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
        ),
        Container(
          height: 15,
          width: stat,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color,
          ),
          child: Stack(
            children: [
              Positioned(
                right: 5,
                child: Text(
                  '$valor/100',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/* class StatsWidget extends ViewController<IDetailsController> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<StatsModel>?>(
      stream: controller.stats.stream,
      builder: (_, snapshot) {
        return Expanded(
          child: ListView.builder(
            itemCount: snapshot.hasData ? snapshot.data!.length : 0,
            itemBuilder: (_, index) {
              return _StatsBar(
                stats: snapshot.hasData ? snapshot.data! : null,
                index: index,
              );
            },
          ),
        );
      },
    );
  }
}

class _StatsBar extends StatelessWidget {
  final List<StatsModel>? stats;
  final int index;

  const _StatsBar({
    required this.stats,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Text(
              stats != null ? stats![index].abeviacao : '',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(width: 40),
            Container(
              width: 200,
              height: 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
            ),
            Container(
              height: 15,
              width: stats != null
                  ? stats!.isNotEmpty
                      ? stats![index].baseStat * 3
                      : 0
                  : 0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: stats![index].colorStats,
              ),
            )
          ],
        ),
      ],
    );
  }
} */
