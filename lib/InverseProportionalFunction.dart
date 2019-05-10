import 'dart:ui';

import 'package:flutter/material.dart';

import 'BaseCustomPainter.dart';
import 'BaseState.dart';
import 'base.dart';

class InverseProportionalFunction extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InverseProportionalFunction();
  }
}

class _InverseProportionalFunction
    extends BaseState<InverseProportionalFunction> {

  List<SliderDataItem> _items = [
    SliderDataItem("k", -5, 5, 1),
  ];

  @override
  List<SliderDataItem> get sliderDataItems => _items;

  @override
  String getTitle() => "y = k / x";

  @override
  CustomPainter createCustomPainter(BuildContext context) {
    return new InverseProportionalFunctionPainter(
        sliderDataItems[0].current);
  }
}

class InverseProportionalFunctionPainter extends BaseCustomPainter {
  // y = k / x
  double _k;

  InverseProportionalFunctionPainter(this._k);


  @override
  List<XValues> get xValuesList => [
    XValues(-abstractSize / 2, -0.01, abstractStep),
    XValues(0.01, abstractSize / 2, abstractStep),
  ];

  double f(double x) => _k / x;
}
