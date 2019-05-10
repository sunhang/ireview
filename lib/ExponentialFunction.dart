import 'dart:math';

import 'package:flutter/material.dart';

import 'BaseCustomPainter.dart';
import 'BaseState.dart';
import 'base.dart';

class ExponentialFunction extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExponentialFunctionState();
  }
}

class _ExponentialFunctionState
    extends BaseState<ExponentialFunction> {
  List<SliderDataItem> _items = [
    SliderDataItem("a", 0, 2.5, 1.5),
  ];

  @override
  List<SliderDataItem> get sliderDataItems => _items;

  @override
  String getTitle() => "y = a ^ x";

  @override
  CustomPainter createCustomPainter(BuildContext context) {
    return new ExponentialFunctionPainter(
        sliderDataItems[0].current);
  }
}

class ExponentialFunctionPainter extends BaseCustomPainter {
  double _a;

  ExponentialFunctionPainter(this._a);

  @override
  double f(double x) => pow(_a, x);
}

