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
    SeekBarDataItem("a", -10, 10, 1),
    SeekBarDataItem("b", -50, 50, 0),
    SeekBarDataItem("c", -20, 20, 10),
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

    basePaint.color = Colors.blue;
    double y;
    List<Offset> list = new List();
    for (double x = -size.width / 2; x <= size.width / 2; x = x + 2) {
      y = _a * x * x + _b * x + _c;

      list.add(new Offset(x + size.width / 2, size.height / 2 - y));
    }

    canvas.drawPoints(PointMode.polygon, list, basePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
