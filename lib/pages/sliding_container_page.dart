import 'package:flutter/material.dart';

class SlidingContainerPage extends StatefulWidget {
  const SlidingContainerPage({super.key});

  @override
  State<SlidingContainerPage> createState() => _SlidingContainerPageState();
}

class _SlidingContainerPageState extends State<SlidingContainerPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _animation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: const Offset(1.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SlideTransition(
        position: _animation,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.orange,
        ),
      ),
    );
  }
}