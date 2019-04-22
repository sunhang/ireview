
import 'package:flutter/widgets.dart';

class LinearEquation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: new LinearEquationPainter());
  }
}


class LinearEquationPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Color.fromARGB(255, 255, 0, 0), BlendMode.srcIn);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }

}

