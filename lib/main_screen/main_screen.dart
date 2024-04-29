
import 'package:flutter/material.dart';
import 'package:project_9/main_screen/widgets/cube_with_changed_position_diagonaly.dart';
import 'package:project_9/main_screen/widgets/cube_with_changed_position_horizontal.dart';

import 'widgets/space16.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  final double _minStat = 50.0;
  final double _maxStat = 150.0;
  late Animation<double> animationWidth;
  late Animation animationColor;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    animationColor =
        ColorTween(begin: Colors.orange, end: Colors.green).animate(controller);
    animationWidth =
        Tween<double>(begin: _minStat, end: _maxStat).animate(controller);

    controller.forward();

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse(from: 1.0);
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.black,
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: animationWidth.value,
                    color: Colors.red,
                  ),
                  const Space16(),
                  Container(
                    color: Colors.black.withOpacity(controller.value),
                    height: 50,
                    width: 50,
                  ),
                  const Space16(),
                  Text(
                    '${(controller.value * 100).toInt()}%',
                    style: const TextStyle(fontSize: 50.0),
                  ),
                  const Space16(),
                  Container(
                    color: animationColor.value,
                    height: 50,
                    width: 50,
                  ),
                  const Space16(),
                  CubeWithChangedPositionHorizontal(controller: controller),
                  const Space16(),
                  CubeWithChangedPositionDiagonaly(controller: controller),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}






