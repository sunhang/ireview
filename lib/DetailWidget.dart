import 'package:flutter/material.dart';

import 'functions.dart';

class DetailWidget extends StatelessWidget {
  final int _data;

  DetailWidget(this._data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(child: new Center(child: _createWidget(_data))));
  }

  StatefulWidget _createWidget(int index) {
    switch (index) {
      case 0: return createLinearEquation();
      case 1: return createQuadraticEquationInOneUnknown();
      case 2: return createInverseProportionalFunction();
      case 3: return createSinFunction();
      case 4: return createExponentialFunction();
      case 5: return createLogFunction();
      default:
        return null;
    }
  }
}
