import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/custom_button.dart';
import 'package:flutter_app/models.dart';

class Link extends StatelessWidget {
  final bool active;
  final String text;
  final VoidCallback onPressed;
  final ButtonFilterPosition position;

  Link({
    @required this.active,
    @required this.text,
    @required this.onPressed,
    @required this.position,
  });

  final RoundedRectangleBorder buttonLeftShape = RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(8)));
  final RoundedRectangleBorder buttonRightShape = RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(8)));

  RoundedRectangleBorder buildShape(){
    if(position == ButtonFilterPosition.LEFT)
      return buttonLeftShape;
    if(position == ButtonFilterPosition.RIGHT)
      return buttonRightShape;
    return RoundedRectangleBorder();
  }
  @override
  Widget build(BuildContext context) {
    return new CustomButton(
      fillColor: active ? Colors.black87 : Colors.white,
      textColor: active ? Colors.white : Colors.black87,
      onPressed: onPressed,
      text: text,
      shape: buildShape()
    );
  }
}