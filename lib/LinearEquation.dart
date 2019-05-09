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
  double f(double x) => _a * x + _b;

}
