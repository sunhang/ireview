import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'base.dart';

abstract class BaseCustomPainter extends CustomPainter {
  @protected
  Paint basePaint = new Paint()
    ..color = Color.fromARGB(255, 0, 0, 0)
    ..strokeWidth = 1;

  double get abstractSize => 10.0;

  double get abstractStep => 0.01;

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

    double step = size.width / abstractSize;
    for (double i = 0; i < size.width / 2; i += step) {
      canvas.drawLine(Offset(size.width / 2 + i, size.height / 2),
          Offset(size.width / 2 + i, size.height / 2 - 10), basePaint);
      canvas.drawLine(Offset(size.width / 2 - i, size.height / 2),
          Offset(size.width / 2 - i, size.height / 2 - 10), basePaint);
    }

    for (double i = 0; i < size.height / 2; i += step) {
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
    _drawFunction(canvas, size);
  }

  void _drawFunction(Canvas canvas, Size size) {
    double ratio = size.width / abstractSize;

    basePaint.color = Colors.blue;

    xValuesList.forEach((xValues){
      List<Offset> list = _generateAbstractOffset(xValues)
          .map((it) => Offset(
          it.dx * ratio + size.width / 2, size.height / 2 - it.dy * ratio))
          .toList();

      canvas.drawPoints(PointMode.polygon, list, basePaint);
    });
  }

  List<XValues> get xValuesList =>
      [XValues(-abstractSize / 2, abstractSize / 2, abstractStep)];

  List<Offset> _generateAbstractOffset(XValues xValues) {
    double y;
    List<Offset> list = new List();

    for (double x = xValues.start; x <= xValues.end; x = x + xValues.step) {
      y = f(x);

      Offset offset = new Offset(x, y);
      list.add(offset);
    }

    return list;
  }

  double f(double x) => x;

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
