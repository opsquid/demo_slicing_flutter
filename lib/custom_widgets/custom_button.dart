import 'package:demoslicingflutter/constants/ui_constants.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String _text;
  final Color _color;
  final TextOverflow overflow;
  const CustomButton({Key? key, required String text, required Color color, this.overflow = TextOverflow.ellipsis})
      : _text = text,
        _color = color,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConstants.buttonWidth,
      height: SizeConstants.buttonHeight,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: _color,
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(RadiusConst.tiny)),
        ),
        child: CustomText(text: _text, color: ColorConstants.white, fontSize: SizeConstants.small, overflow: overflow),
      ),
    );
  }
}
