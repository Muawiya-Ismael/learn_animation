import 'dart:math';

import 'package:flutter/material.dart';

class RotatingSquarePage extends StatefulWidget {
  const RotatingSquarePage({super.key});

  @override
  State<RotatingSquarePage> createState() => _RotatingSquarePageState();
}

class _RotatingSquarePageState extends State<RotatingSquarePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
    _animation = Tween<double>(begin: 0, end: 2 * pi).animate(_controller);
  }@override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.rotate(
            angle: _animation.value,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ),
          );
        },
      ),
    );
  }
}