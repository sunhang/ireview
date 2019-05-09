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

  List<SliderDataItem> _items = [
    SliderDataItem("a", -5, 5, 1),
    SliderDataItem("b", -10, 10, 0),
    SliderDataItem("c", -5, 5, 3),
  ];

  @override
  List<SliderDataItem> get seekBarDataItems => _items;

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
  double f(double x) => _a * x * x + _b * x + _c;
}
