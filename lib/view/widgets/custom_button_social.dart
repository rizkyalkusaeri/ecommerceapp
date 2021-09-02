import 'package:ecommerceapp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButtonSocial extends StatelessWidget {
  final String text;
  final Function onPressed;
  final String imageName;
  const CustomButtonSocial({Key key, this.text, this.onPressed, this.imageName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.grey.shade200),
      // ignore: deprecated_member_use
      child: FlatButton(
          onPressed: onPressed,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Image.asset(
                'assets/images/$imageName',
                height: 20,
                width: 20,
              ),
              SizedBox(
                width: 90,
              ),
              CustomText(
                text: text,
              ),
            ],
          )),
    );
  }
}
