import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';
import 'package:flutter_seekbar/flutter_seekbar.dart' show SeekBar;

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
        ),
        Padding(
            padding:
                new EdgeInsets.only(left: 20, top: 40, right: 20, bottom: 10),
            child: SeekBar(
              progresseight: 5,
              value: 0.5,
              sectionCount: 5,
            )),
        Padding(
            padding:
                new EdgeInsets.only(left: 20, top: 40, right: 20, bottom: 10),
            child: SeekBar(
              progresseight: 5,
              value: 0.5,
              sectionCount: 5,
            ))
      ],
    );
  }
}

class LinearEquationPainter extends CustomPainter {
  Paint _paint = new Paint()
    ..color = Color.fromARGB(255, 0, 0, 0)
    ..strokeWidth = 1;

  // y = a * x + b
  double _a = 0.8;
  double _b = 10;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset(0, 0) & size;

    print("$rect");

    canvas.clipRect(rect);
//    canvas.drawColor(Color.fromARGB(255, 255, 255, 255), BlendMode.srcIn);

    _paint.color = Colors.black;

    Offset p0 = Offset(0, size.height / 2);
    Offset p1 = Offset(size.width, size.height / 2);

    canvas.drawLine(p0, p1, _paint);

    p0 = Offset(size.width / 2, 0);
    p1 = Offset(size.width / 2, size.height);

    canvas.drawLine(p0, p1, _paint);

    for (double i = 0; i < size.width / 2; i += 40) {
      canvas.drawLine(Offset(size.width / 2 + i, size.height / 2),
          Offset(size.width / 2 + i, size.height / 2 - 10), _paint);
      canvas.drawLine(Offset(size.width / 2 - i, size.height / 2),
          Offset(size.width / 2 - i, size.height / 2 - 10), _paint);
    }

    for (double i = 0; i < size.height / 2; i += 40) {
      canvas.drawLine(Offset(size.width / 2, size.height / 2 + i),
          Offset(size.width / 2 + 10, size.height / 2 + i), _paint);
      canvas.drawLine(Offset(size.width / 2, size.height / 2 - i),
          Offset(size.width / 2 + 10, size.height / 2 - i), _paint);
    }

    final arrowSize = 15.0;
    // 画X轴箭头
    canvas.drawLine(Offset(size.width, size.height / 2),
        Offset(size.width - arrowSize, size.height / 2 - arrowSize), _paint);
    canvas.drawLine(Offset(size.width, size.height / 2),
        Offset(size.width - arrowSize, size.height / 2 + arrowSize), _paint);

    // 画Y轴箭头
    canvas.drawLine(Offset(size.width / 2, 0),
        Offset(size.width / 2 - arrowSize, arrowSize), _paint);
    canvas.drawLine(Offset(size.width / 2, 0),
        Offset(size.width / 2 + arrowSize, arrowSize), _paint);

    // 绘制O
    TextSpan span = new TextSpan(
        style: new TextStyle(color: Colors.black, fontSize: 20.0), text: "O");
    TextPainter tp =
        new TextPainter(text: span, textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(canvas, new Offset(size.width / 2 - tp.width, size.height / 2));

    // 绘制X
    TextSpan spanX = new TextSpan(
        style: new TextStyle(color: Colors.black, fontSize: 20.0), text: "X");
    TextPainter tpX =
        new TextPainter(text: spanX, textDirection: TextDirection.ltr);
    tpX.layout();
    tpX.paint(canvas,
        new Offset(size.width - tpX.width, size.height / 2 + arrowSize));

    // 绘制Y
    TextSpan spanY = new TextSpan(
        style: new TextStyle(color: Colors.black, fontSize: 20.0), text: "Y");
    TextPainter tpY =
        new TextPainter(text: spanY, textDirection: TextDirection.ltr);
    tpY.layout();
    tpY.paint(canvas, new Offset(size.width / 2 - tpY.width - arrowSize, 0));

    _paint.color = Colors.blue;
    double y;
    List<Offset> list = new List();
    for (double x = -size.width / 2; x <= size.width / 2; x = x + 20) {
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
