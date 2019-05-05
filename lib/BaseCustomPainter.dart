import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BaseCustomPainter extends CustomPainter {
  @protected
  Paint basePaint = new Paint()
    ..color = Color.fromARGB(255, 0, 0, 0)
    ..strokeWidth = 1;

  BaseCustomPainter();

  @protected
  void _drawCoordinateAxis(Canvas canvas, Size size) {
    basePaint.color = Colors.black;

    Offset p0 = Offset(0, size.height / 2);
    Offset p1 = Offset(size.width, size.height / 2);

    canvas.drawLine(p0, p1, basePaint);

    p0 = Offset(size.width / 2, 0);
    p1 = Offset(size.width / 2, size.height);

    canvas.drawLine(p0, p1, basePaint);

    for (double i = 0; i < size.width / 2; i += 40) {
      canvas.drawLine(Offset(size.width / 2 + i, size.height / 2),
          Offset(size.width / 2 + i, size.height / 2 - 10), basePaint);
      canvas.drawLine(Offset(size.width / 2 - i, size.height / 2),
          Offset(size.width / 2 - i, size.height / 2 - 10), basePaint);
    }

    for (double i = 0; i < size.height / 2; i += 40) {
      canvas.drawLine(Offset(size.width / 2, size.height / 2 + i),
          Offset(size.width / 2 + 10, size.height / 2 + i), basePaint);
      canvas.drawLine(Offset(size.width / 2, size.height / 2 - i),
          Offset(size.width / 2 + 10, size.height / 2 - i), basePaint);
    }

    final arrowSize = 15.0;
    // 画X轴箭头
    canvas.drawLine(Offset(size.width, size.height / 2),
        Offset(size.width - arrowSize, size.height / 2 - arrowSize), basePaint);
    canvas.drawLine(Offset(size.width, size.height / 2),
        Offset(size.width - arrowSize, size.height / 2 + arrowSize), basePaint);

    // 画Y轴箭头
    canvas.drawLine(Offset(size.width / 2, 0),
        Offset(size.width / 2 - arrowSize, arrowSize), basePaint);
    canvas.drawLine(Offset(size.width / 2, 0),
        Offset(size.width / 2 + arrowSize, arrowSize), basePaint);

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
  }

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset(0, 0) & size;

    print("$rect");

    canvas.clipRect(rect);
    _drawCoordinateAxis(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
