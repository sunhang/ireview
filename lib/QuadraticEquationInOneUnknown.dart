import 'dart:ui';
import 'package:flutter/material.dart';
import 'BaseCustomPainter.dart';
import 'package:flutter_seekbar/flutter_seekbar.dart'
    show SeekBar, ProgressValue;

import 'BaseState.dart';

class QuadraticEquationInOneUnknown extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuadraticEquationInOneUnknownState();
  }
}

class _QuadraticEquationInOneUnknownState
    extends BaseState<QuadraticEquationInOneUnknown> {

  _QuadraticEquationInOneUnknownState() {
    coefficients..add("a", -10, 10, 1)..add("b", -50, 50, 0)..add("c", -20, 20, 10);
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: new EdgeInsets.only(bottom: 10),
          child: Text(
            "y = a * x ^ 2 + b * x + c",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Padding(
            padding: new EdgeInsets.only(bottom: 30),
            child: Text(
                "a: ${coefficients["a"].current.toStringAsFixed(1)}  b:${coefficients["b"].current.toStringAsFixed(1)} c:${coefficients["c"].current.toStringAsFixed(1)}",
                style: TextStyle(fontSize: 20, color: Colors.red))),
        new Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          child: CustomPaint(
              painter: new QuadraticEquationInOneUnknownPainter(
                coefficients["a"].current, coefficients["b"].current, coefficients["c"].current)),
        ),
      ]..addAll(createSeekbars(context)),
    );
  }
}

class QuadraticEquationInOneUnknownPainter extends BaseCustomPainter {
  // y = a * x ^ 2 + b * x + c
  double _a;
  double _b;
  double _c;

  QuadraticEquationInOneUnknownPainter(this._a, this._b, this._c);

  @override
  void paint(Canvas canvas, Size size) {
    super.paint(canvas, size);

    basePaint.color = Colors.blue;
    double y;
    List<Offset> list = new List();
    for (double x = -size.width / 2; x <= size.width / 2; x = x + 2) {
      y = _a * x * x + _b * x + _c;

      list.add(new Offset(x + size.width / 2, size.height / 2 - y));
    }

    canvas.drawPoints(PointMode.polygon, list, basePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
