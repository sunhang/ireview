import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';
import 'package:flutter_seekbar/flutter_seekbar.dart'
    show SeekBar, ProgressValue;

import 'BaseCustomPainter.dart';
import 'BaseState.dart';

class LinearEquation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LinearEquationState();
  }
}

class _LinearEquationState extends BaseState<LinearEquation> {
  _LinearEquationState() {
    coefficients..add("a", -10, 10, 1)..add("b", -50, 50, 0);
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: new EdgeInsets.only(bottom: 10),
            child: Text(
              "y = a * x + b",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
              padding: new EdgeInsets.only(bottom: 30),
              child: Text(
                  "a: ${coefficients["a"].current.toStringAsFixed(1)}  b:${coefficients["b"].current.toStringAsFixed(1)}",
                  style: TextStyle(fontSize: 20, color: Colors.red))),
          new Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            child: CustomPaint(
                painter: new LinearEquationPainter(
                    coefficients["a"].current, coefficients["b"].current)),
          ),
        ]..addAll(createSeekbars(context)));
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
