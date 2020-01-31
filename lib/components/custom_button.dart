import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {@required this.onPressed,
      @required this.text,
      @required this.fillColor,
      @required this.textColor,
      this.shape});
  final GestureTapCallback onPressed;
  final String text;
  final Color fillColor;
  final Color textColor;
  final ShapeBorder shape;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: fillColor,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            text,
            maxLines: 1,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
      onPressed: onPressed,
      shape: shape,
    );
  }
}
