import 'package:flutter/widgets.dart';
import 'dart:ui';

class LinearEquation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          child: CustomPaint(painter: new LinearEquationPainter()),
        )
      ],
    );
  }
}

class LinearEquationPainter extends CustomPainter {
  Paint _paint = new Paint()
    ..color = Color.fromARGB(255, 0, 0, 0)
    ..strokeWidth = 1;

  // y = a * x + b
  int _a = 8;
  int _b = 10;

  @override
  void paint(Canvas canvas, Size size) {

//    canvas.drawColor(Color.fromARGB(255, 255, 255, 255), BlendMode.srcIn);

    Offset p0 = Offset(0, size.height / 2);
    Offset p1 = Offset(size.width, size.height / 2);

    canvas.drawLine(p0, p1, _paint);

    p0 = Offset(size.width / 2, 0);
    p1 = Offset(size.width / 2, size.height);
    canvas.drawLine(p0, p1, _paint);

    double y;
    List<Offset> list = new List();
    for (double x = -100; x <= 100; x = x + 1) {
      y = _a * x + _b;

      list.add(new Offset(x + size.width / 2, size.height / 2 - y));
    }

    canvas.drawPoints(PointMode.polygon, list, _paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
