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

  List<Offset> generateAbstractOffset(double abstractSize) {
    double y;
    List<Offset> list = new List();

    double step = abstractStep;
    for (double x = 0.01; x < abstractSize / 2; x = x + step) {
      y = f(x);

      Offset offset = new Offset(x, y);
      list.add(offset);
    }

    return list;
  }

  double f(double x) => log(x);
}