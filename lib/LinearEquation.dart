import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';
import 'package:flutter_seekbar/flutter_seekbar.dart'
    show SeekBar, ProgressValue;

import 'BaseCustomPainter.dart';

class LinearEquation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LinearEquationState();
  }
}

class SeekbarInitalData {
  final String title;
  final double min;
  final double max;
  double current;

  SeekbarInitalData(this.title, this.min, this.max, this.current);
}

class _LinearEquationState extends State<LinearEquation> {
  LinkedHashMap<String, SeekbarInitalData> _coefficients =
      new LinkedHashMap<String, SeekbarInitalData>();

  _LinearEquationState() {
    _coefficients["a"] = SeekbarInitalData("a", -10, 10, 1);
    _coefficients["b"] = SeekbarInitalData("b", -50, 50, 0);
  }

  List<Widget> seekbars(
      BuildContext context, List<SeekbarInitalData> initalData) {
    List<Widget> widgets = new List<Widget>();

    const int SECTION_COUNT = 100;

    initalData.forEach((element) {
      var padding = Padding(
        padding: new EdgeInsets.only(left: 20, top: 40, right: 20, bottom: 10),
        child: Row(
          children: <Widget>[
            Padding(
              padding: new EdgeInsets.only(right: 10),
              child: Text(element.title, style: TextStyle(fontSize: 20)),
            ),
            Expanded(
                child: SeekBar(
                    progresseight: 8,
                    value: (element.current - element.min) *
                        SECTION_COUNT /
                        (element.max - element.min),
                    sectionCount: SECTION_COUNT,
                    onValueChanged: (ProgressValue value) {
                      setState(() {
                        element.current =
                            value.value * (element.max - element.min) / 100 +
                                element.min;
                      });
                    })),
          ],
        ),
      );

      widgets.add(padding);
    });

    return widgets;
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
                  "a: ${_coefficients["a"].current.toStringAsFixed(1)}  b:${_coefficients["b"].current.toStringAsFixed(1)}",
                  style: TextStyle(fontSize: 20, color: Colors.red))),
          new Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            child: CustomPaint(
                painter: new LinearEquationPainter(
                    _coefficients["a"].current, _coefficients["b"].current)),
          ),
        ]..addAll(seekbars(context,
            _coefficients.entries.map((entry) => entry.value).toList())));
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
