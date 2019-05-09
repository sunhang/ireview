import 'package:flutter/material.dart';

import 'InverseProportionalFunction.dart';
import 'LinearEquation.dart';
import 'QuadraticEquationInOneUnknown.dart';
import 'SinFunction.dart';

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
      case 2:
        // 反比例函数
        return new InverseProportionalFunction();
      case 3:
        return new SinFunction();
      default:
        return null;
    }
  }
}
