import 'dart:ui';
import 'package:flutter/material.dart';
import 'BaseCustomPainter.dart';
import 'package:flutter_seekbar/flutter_seekbar.dart'
    show SeekBar, ProgressValue;

import 'BaseState.dart';
import 'base.dart';

class QuadraticEquationInOneUnknown extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuadraticEquationInOneUnknownState();
  }
}

class _QuadraticEquationInOneUnknownState
    extends BaseState<QuadraticEquationInOneUnknown> {

  List<SeekBarDataItem> _items = [
    SeekBarDataItem("a", -5, 5, 1),
    SeekBarDataItem("b", -10, 10, 0),
    SeekBarDataItem("c", -5, 5, 3),
  ];

  @override
  List<SeekBarDataItem> get seekBarDataItems => _items;

  @override
  String getTitle() => "y = a * x ^ 2 + b * x + c";

  @override
  CustomPainter createCustomPainter(BuildContext context) {
    return new QuadraticEquationInOneUnknownPainter(
        seekBarDataItems[0].current,
        seekBarDataItems[1].current,
        seekBarDataItems[2].current);
  }
}

class QuadraticEquationInOneUnknownPainter extends BaseCustomPainter {
  // y = a * x ^ 2 + b * x + c
  double _a;
  double _b;
  double _c;

  QuadraticEquationInOneUnknownPainter(this._a, this._b, this._c);

  @override
  void paint(Canvas canvas, Size size) {
    super.paint(canvas, size);

    double abstractSize = 10.0;
    double step = 0.01;
    double ratio = size.width / abstractSize;

    basePaint.color = Colors.blue;
    double y;
    List<Offset> list = new List();

    for (double x = - abstractSize / 2; x <= abstractSize / 2; x = x + step) {
      y = _a * x * x + _b * x + _c;

      Offset offset = new Offset(x * ratio + size.width / 2, size.height / 2 - y * ratio);
      list.add(offset);
    }

    canvas.drawPoints(PointMode.polygon, list, basePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
