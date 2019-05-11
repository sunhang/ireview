import 'dart:math';

import 'package:flutter/material.dart';
import 'base.dart';

// 一元一次方程
StatefulWidget createLinearEquation() {
  List<SliderDataItem> items = [
    SliderDataItem("a", -10, 10, 1),
    SliderDataItem("b", -50, 50, 0)
  ];

  return FunctionStatefulWidget(
    title: "y = a * x + b",
    items: items,
    mathFunc: (double x) {
      double a = items[0].current;
      double b = items[1].current;
      return a * x + b;
    },
  );
}

// 一元二次方程
StatefulWidget createQuadraticEquationInOneUnknown() {
  List<SliderDataItem> items = [
    SliderDataItem("a", -5, 5, 1),
    SliderDataItem("b", -10, 10, 0),
    SliderDataItem("c", -5, 5, 3),
  ];

  return FunctionStatefulWidget(
    title: "y = a * x ^ 2 + b * x + c",
    items: items,
    mathFunc: (double x) {
      double a = items[0].current;
      double b = items[1].current;
      double c = items[2].current;
      return a * x * x + b * x + c;
    },
  );
}

// 反比例函数
StatefulWidget createInverseProportionalFunction() {
  List<SliderDataItem> items = [
    SliderDataItem("k", -5, 5, 1),
  ];

  return FunctionStatefulWidget(
    title: "y = k / x",
    items: items,
    mathFunc: (x) {
      double k = items[0].current;
      return k / x;
    },
    xValuesListGenerator: (abstractSize, abstractStep) => [
          XValues(-abstractSize / 2, -0.01, abstractStep),
          XValues(0.01, abstractSize / 2, abstractStep),
        ],
  );
}

// sin函数

StatefulWidget createSinFunction() {
  List<SliderDataItem> items = [
    SliderDataItem("a", -5, 5, 1),
    SliderDataItem("b", -10, 10, 2),
  ];

  return FunctionStatefulWidget(
    title: "y = a * sin(b * x)",
    items: items,
    mathFunc: (x) {
      double a = items[0].current;
      double b = items[1].current;

      return a * sin(b * x);
    },
  );
}

// 指数函数
StatefulWidget createExponentialFunction() {
  List<SliderDataItem> items = [
    SliderDataItem("a", 0, 2.5, 1.5),
  ];

  return FunctionStatefulWidget(
    title: "y = a ^ x",
    items: items,
    mathFunc: (x) {
      double a = items[0].current;
      return pow(a, x);
    },
  );
}

// 对数函数
StatefulWidget createLogFunction() {
  return FunctionStatefulWidget(
    title: "y = log x",
    items: [],
    mathFunc: (x) {
      return log(x);
    },
    xValuesListGenerator: (abstractSize, abstractStep) =>
        [XValues(0.01, abstractSize / 2, abstractStep)],
  );
}
