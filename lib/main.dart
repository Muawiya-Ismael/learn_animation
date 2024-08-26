import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _size = 100.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Size: ${_size.toStringAsFixed(0)}'),
              Slider(
                value: _size,
                min: 50.0,
                max: 500.0,
                onChanged: (newSize) {
                  setState(() {
                    _size = newSize;
                  });
                },
              ),
            ],
          )
        ],
      ),
      body:Center(
        child: AnimatedContainer(
          width: _size,
          height: _size,
          color:const Color(0xFFd0bcff),
          duration: const Duration(seconds: 1),
          curve: Curves.easeOutCubic,
        ),
      ),
    );
  }
}
