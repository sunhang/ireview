import 'package:flutter/material.dart';

import 'package:ireview/base/BaseCustomPainter.dart';
import 'package:ireview/base/BaseState.dart';

class XValues {
  final double start;
  final double end;
  final double step;

  const XValues(this.start, this.end, this.step);
}

typedef void NotifyRefresh();
typedef List<XValues> XValuesListGenerator(double abstractSize, double abstractStep);
typedef double Func(double x);


class SliderDataItem {
  double current;
  final String title;
  final double min;
  final double max;

  SliderDataItem(this.title, this.min, this.max, this.current);
}

List<Widget> sliders(BuildContext context, List<SliderDataItem> initalData,
    NotifyRefresh notifyRefresh) {
  List<Widget> widgets = new List<Widget>();

  const int SECTION_COUNT = 100;

  initalData.forEach((element) {
    var padding = Padding(
      padding: new EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 15),
      child: Row(
        children: <Widget>[
          Padding(
            padding: new EdgeInsets.only(right: 10),
            child: Text(element.title, style: TextStyle(fontSize: 20)),
          ),
          Expanded(
              child: Slider(
                  min: 0,
                  max: 100,
                  value: (element.current - element.min) *
                      SECTION_COUNT /
                      (element.max - element.min),
                  onChanged: (value) {
                    element.current =
                        value * (element.max - element.min) / 100 + element.min;
                    notifyRefresh();
                  })),
        ],
      ),
    );

    widgets.add(padding);
  });

  return widgets;
}

class FunctionStatefulWidget extends StatefulWidget {
  final String title;
  final List<SliderDataItem> items;
  final Func mathFunc;
  final XValuesListGenerator xValuesListGenerator;

  const FunctionStatefulWidget(
      {@required this.title, @required this.items, @required this.mathFunc, this.xValuesListGenerator});

  @override
  State<StatefulWidget> createState() {
    return _FunctionState(title, items, mathFunc, xValuesListGenerator);
  }
}

class _FunctionState extends BaseState<FunctionStatefulWidget> {
  String _title;
  List<SliderDataItem> _items;
  Func _mathFunc;
  XValuesListGenerator _xValuesListGenerator;

  _FunctionState(this._title, this._items, this._mathFunc, this._xValuesListGenerator);

  @override
  CustomPainter createCustomPainter(BuildContext context) =>
      _FunctionPainter(_mathFunc, _xValuesListGenerator);

  @override
  String getTitle() => _title;

  @override
  List<SliderDataItem> get sliderDataItems => _items;
}

class _FunctionPainter extends BaseCustomPainter {
  final Func _fun;
  final XValuesListGenerator _xValuesListGenerator;

  _FunctionPainter(this._fun, this._xValuesListGenerator);

  @override
  double f(double x) => _fun(x);

  @override
  List<XValues> get xValuesList {
    if (_xValuesListGenerator != null) {
      return _xValuesListGenerator(abstractSize, abstractStep);
    } else {
      return super.xValuesList;
    }
  }
}
