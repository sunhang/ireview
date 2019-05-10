import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'BaseCustomPainter.dart';
import 'BaseState.dart';
import 'base.dart';

class LogFunction extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LogFunctionState();
  }
}

class _LogFunctionState
    extends BaseState<LogFunction> {

  List<SliderDataItem> _items = [];

  @override
  List<SliderDataItem> get sliderDataItems => _items;

  @override
  String getTitle() => "y = log x";

  @override
  CustomPainter createCustomPainter(BuildContext context) {
    return new LogFunctionPainter();
  }
}

class LogFunctionPainter extends BaseCustomPainter {
  double f(double x) => log(x);

  @override
  List<XValues> get xValuesList => [XValues(0.01, abstractSize / 2, abstractStep)];
}