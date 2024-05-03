import 'package:flutter/material.dart';

import '../widgets/concave_polygon_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Offset> vertics = [
    const Offset(100, 100),
    const Offset(200, 200),
    const Offset(300, 100),
    const Offset(250, 50),
    const Offset(150, 50),
  ];
  double _rotationAngle = 0.0;

  void _rotateCustomPaint() {
    setState(() {
      _rotationAngle += 45.0; // Increment the rotation angle
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: _rotateCustomPaint,
          child: const Icon(Icons.rotate_right),
        ),
        appBar: AppBar(
          title: const Text('Simple Shader Demo'),
        ),
        body: RotatedBox(
          quarterTurns:
              _rotationAngle ~/ 90, // Adjust rotation angle to quarter turns
          child: ConcavePolygonWidget(
            vertices: vertics,
          ),
        ));
  }
}
