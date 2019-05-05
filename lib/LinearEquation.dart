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

class _LinearEquationState extends State<LinearEquation> {
  double _seekbarAValue = 65;
  double _seekbarBValue = 50;

  double _getA() {
    // 求值范围是-10到10
    return (_seekbarAValue - 50) / 5.0;
  }

  double _getB() {
    return _seekbarBValue - 50;
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
            child: Text("a: ${_getA().toStringAsFixed(1)}  b:${_getB().toStringAsFixed(1)}", style: TextStyle(fontSize: 20, color: Colors.red))),
        new Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          child: CustomPaint(painter: new LinearEquationPainter(_getA(), _getB())),
        ),
        Padding(
          padding:
              new EdgeInsets.only(left: 20, top: 40, right: 20, bottom: 10),
          child: Row(
            children: <Widget>[
              Padding(
                padding: new EdgeInsets.only(right: 10),
                child: Text("a:", style: TextStyle(fontSize: 20)),
              ),
              Expanded(
                  child: SeekBar(
                      progresseight: 5,
                      value: _seekbarAValue,
                      sectionCount: 100,
                      onValueChanged: (ProgressValue value) {
                        setState(() {
                          _seekbarAValue = value.value;
                        });
                      })),
            ],
          ),
        ),
        Padding(
            padding:
                new EdgeInsets.only(left: 20, top: 40, right: 20, bottom: 10),
            child: Row(children: <Widget>[
              Padding(
                padding: new EdgeInsets.only(right: 10),
                child: Text("b:", style: TextStyle(fontSize: 20)),
              ),
              Expanded(
                  child: SeekBar(
                progresseight: 5,
                value: _seekbarBValue,
                sectionCount: 100,
                onValueChanged: (ProgressValue value) {
                  setState(() {
                    _seekbarBValue = value.value;
                  });
                },
              )),
            ])),
      ],
    );
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
