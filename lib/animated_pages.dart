import 'package:flutter/material.dart';
import 'pages/fading_image_page.dart';
import 'pages/pulsating_circle_page.dart';
import 'pages/rotating_square_page.dart';
import 'pages/sliding_container_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animated Pages App',
      theme:ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const PulsatingCirclePage(),
    const FadingImagePage(),
    const RotatingSquarePage(),
    const SlidingContainerPage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Pages App'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.circle,color:Colors.white,),
            label: 'Pulsating',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image,color:Colors.white,),
            label: 'Fading',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.square,color:Colors.white,),
            label: 'Rotating',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward,color:Colors.white,),
            label: 'Sliding',
          ),
        ],
      ),
    );
  }
}