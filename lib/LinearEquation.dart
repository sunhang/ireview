import 'package:flutter/widgets.dart';

class LinearEquation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: new LinearEquationPainter());
  }
}

class LinearEquationPainter extends CustomPainter {
  Paint _paint = new Paint()
    ..color = Color.fromARGB(255, 0, 0, 0)
    ..strokeWidth = 1;

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;

//    canvas.drawColor(Color.fromARGB(255, 255, 255, 255), BlendMode.srcIn);

    Offset p0 = Offset(0, size.height / 2);
    Offset p1 = Offset(size.width, size.height / 2);

    print("$size $rect");
    print("$p0  $p1");
    canvas.drawLine(p0, p1, _paint);

    p0 = Offset(size.width / 2, 0);
    p1 = Offset(size.width / 2, size.height);
    canvas.drawLine(p0, p1, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
