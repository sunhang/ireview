import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';
import 'package:flutter_seekbar/flutter_seekbar.dart'
    show SeekBar, ProgressValue;

import 'BaseCustomPainter.dart';
import 'BaseState.dart';
import 'base.dart';

class LinearEquation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LinearEquationState();
  }
}

class _LinearEquationState extends BaseState<LinearEquation> {
  List<SliderDataItem> _items = [
      SliderDataItem("a", -10, 10, 1),
      SliderDataItem("b", -50, 50, 0)
    ];

  _LinearEquationState() :super();

  @override
  List<SliderDataItem> get seekBarDataItems => _items;

  @override
  String getTitle() => "y = a * x + b";

  @override
  CustomPainter createCustomPainter(BuildContext context) {
    return new LinearEquationPainter(seekBarDataItems[0].current, seekBarDataItems[1].current);
  }
}

class LinearEquationPainter extends BaseCustomPainter {
  // y = a * x + b
  double _a = 0.8;
  double _b = 10;

  LinearEquationPainter(this._a, this._b);

  @override
  void paint(Canvas canvas, Size size) {
    super.paint(canvas, size);

    basePaint.color = Colors.blue;
    double y;
    List<Offset> list = new List();
    for (double x = -size.width / 2; x <= size.width / 2; x = x + 20) {
      y = _a * x + _b;

      list.add(new Offset(x + size.width / 2, size.height / 2 - y));
    }

    canvas.drawPoints(PointMode.polygon, list, basePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
