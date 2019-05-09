import 'dart:math';
import 'package:flutter/material.dart';
import 'BaseCustomPainter.dart';

import 'BaseState.dart';
import 'base.dart';

class SinFunction extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SinFunctionState();
  }
}

class _SinFunctionState
    extends BaseState<SinFunction> {

  List<SliderDataItem> _items = [
    SliderDataItem("a", -5, 5, 1),
    SliderDataItem("b", -10, 10, 2),
  ];

  @override
  List<SliderDataItem> get sliderDataItems => _items;

  @override
  String getTitle() => "y = a * sin(b * x)";

  @override
  CustomPainter createCustomPainter(BuildContext context) {
    return new SinFunPainter(
        sliderDataItems[0].current,
        sliderDataItems[1].current);
  }
}

class SinFunPainter extends BaseCustomPainter {
  double _a;
  double _b;

  SinFunPainter(this._a, this._b);

  @override
  double f(double x) => _a * sin(_b * x);
}