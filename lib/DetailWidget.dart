import 'package:flutter/material.dart';

import 'LinearEquation.dart';
import 'QuadraticEquationInOneUnknown.dart';

class DetailWidget extends StatelessWidget {
  final int _data;

  DetailWidget(this._data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(child: new Center(child: _createWidget(_data))));
  }

  StatefulWidget _createWidget(int index) {
    switch(index) {
      case 0:
        return new LinearEquation();
      case 1:
        return new QuadraticEquationInOneUnknown();
      default:
        return null;
    }
  }
}
