import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String _text;
  final double _fontSize;
  final Color _color;

  const CustomText({Key? key, required String text, required double fontSize, required Color color})
      : _text = text,
        _fontSize = fontSize,
        _color = color,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(fontSize: _fontSize, color: _color, fontWeight: FontWeight.bold),
      overflow: TextOverflow.ellipsis,
    );
  }
}
