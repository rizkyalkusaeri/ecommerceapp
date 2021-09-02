import 'package:ecommerceapp/constant.dart';
import 'package:ecommerceapp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  const CustomButton({Key key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return FlatButton(
      onPressed: onPressed,
      child: CustomText(
          text: text, alignment: Alignment.center, color: Colors.white),
      color: primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(18),
    );
  }
}
