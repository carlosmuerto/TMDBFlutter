import 'package:flutter/material.dart';
import '../presentation_utils.dart';

class BorderedText extends StatelessWidget {
  const BorderedText({
    Key key,
    @required this.title,
    @required double fountSize,
    @required double fountStrokeWidth,
  })  : _fountSize = fountSize,
        _fountStrokeWidth = fountStrokeWidth,
        super(key: key);

  final String title;
  final double _fountSize;
  final double _fountStrokeWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Stroked text as border.
        Text(
          title,
          maxLines: null,
          style: TextStyle(
            fontSize: _fountSize,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = _fountStrokeWidth
              ..color = Colors.black87,
          ),
        ),
        // Solid text as fill.
        Text(
          title,
          maxLines: null,
          style: TextStyle(
            fontSize: _fountSize,
            color: Colors.grey[300],
          ),
        ),
      ],
    );
  }
}

class SomeErrorHappend extends StatelessWidget {
  const SomeErrorHappend({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      alignment: Alignment.center,
      child: Text(
        context.s.someErrorHappend,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
