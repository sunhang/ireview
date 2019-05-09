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
  void drawFunction(Canvas canvas, Size size) {
    double ratio = size.width / abstractSize;

    basePaint.color = Colors.blue;

    List<Offset> list = generateAbstractOffsetWithNegativeX(abstractSize)
        .map((it) => Offset(
        it.dx * ratio + size.width / 2, size.height / 2 - it.dy * ratio))
        .toList();

    canvas.drawPoints(PointMode.polygon, list, basePaint);

    List<Offset> list1 = generateAbstractOffsetWithPositiveX(abstractSize)
        .map((it) => Offset(
        it.dx * ratio + size.width / 2, size.height / 2 - it.dy * ratio))
        .toList();

    canvas.drawPoints(PointMode.polygon, list1, basePaint);
  }

  List<Offset> generateAbstractOffsetWithNegativeX(double abstractSize) {
    double y;
    List<Offset> list = new List();

    double step = abstractStep;
    for (double x = -abstractSize / 2; x < 0; x = x + step) {
      y = f(x);

      Offset offset = new Offset(x, y);
      list.add(offset);
    }

    return list;
  }

  List<Offset> generateAbstractOffsetWithPositiveX(double abstractSize) {
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

  double f(double x) => _k / x;
}
