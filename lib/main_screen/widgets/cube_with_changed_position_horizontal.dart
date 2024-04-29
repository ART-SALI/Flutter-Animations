import 'package:flutter/material.dart';

class CubeWithChangedPositionHorizontal extends StatelessWidget {
  const CubeWithChangedPositionHorizontal({
    super.key,
    required this.controller,
  });

  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: (controller.value * 100).toInt(),
          child: Container(
            height: 50,
          ),
        ),
        Container(
          color: Colors.yellow,
          height: 50,
          width: 50,
        ),
        Flexible(
            flex: (100 - controller.value * 100).toInt(),
            child: Container(
              height: 50,
            )),
      ],
    );
  }
}