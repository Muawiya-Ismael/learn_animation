import 'package:flutter/material.dart';

class PulsatingCirclePage extends StatefulWidget {
  const PulsatingCirclePage({super.key});

  @override
  State<PulsatingCirclePage> createState() => _PulsatingCirclePageState();
}

class _PulsatingCirclePageState extends State<PulsatingCirclePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 50, end: 100).animate(_controller);
  }

  @override
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
          return Container(
            width: _animation.value,
            height: _animation.value,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(_animation.value / 2),
            ),
          );
        },
      ),
    );
  }
}