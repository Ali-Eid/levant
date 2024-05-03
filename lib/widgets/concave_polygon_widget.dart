import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';
import 'dart:ui' as ui;

class ConcavePolygonWidget extends StatelessWidget {
  final List<Offset> vertices;
  final Color color;
  final double strokeWidth;

  const ConcavePolygonWidget({
    super.key,
    required this.vertices,
    this.color = Colors.black,
    this.strokeWidth = 1,
  });

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      child: ShaderBuilder(
        assetKey: 'shaders/simple.frag',
        (context, shader, child) => CustomPaint(
          size: MediaQuery.of(context).size,
          painter: ShaderPainter(
            vertices: vertices,
            shader: shader,
            // color: Colors.amber,
            // strokeWidth: 20,
          ),
        ),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class ConcavePolygon {
  List<Offset> vertices;

  ConcavePolygon(this.vertices);
}

class ShaderPainter extends CustomPainter {
  ui.FragmentShader shader;
  List<Offset> vertices;
  // final Color color;
  // final double strokeWidth;
  ShaderPainter({
    required this.shader,
    required this.vertices,
    // required this.color,
    // required this.strokeWidth
  });
  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    Paint paint = Paint()
      // ..color = color
      // ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    paint = Paint()..shader = shader;
    Path path = Path();
    path.moveTo(vertices.first.dx, vertices.first.dy);
    for (int i = 1; i < vertices.length; i++) {
      path.lineTo(vertices[i].dx, vertices[i].dy);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
