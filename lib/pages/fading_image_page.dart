import 'package:flutter/material.dart';

class FadingImagePage extends StatefulWidget {
  const FadingImagePage({super.key});

  @override
  State<FadingImagePage> createState() => _FadingImagePageState();
}

class _FadingImagePageState extends State<FadingImagePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: _animation,
        child: Image.network(
          'https://picsum.photos/250/250', // Replace with your image URL
        ),
      ),
    );
  }
}