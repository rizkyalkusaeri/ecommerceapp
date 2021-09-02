import 'package:ecommerceapp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hint;
  final Function onSave;
  final Function validator;
  const CustomTextFormField(
      {Key key, this.text, this.hint, this.onSave, this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        CustomText(
          text: text,
          fontSize: 14,
          color: Colors.grey.shade900,
        ),
        TextFormField(
          onSaved: onSave,
          validator: validator,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.black),
              fillColor: Colors.white),
        )
      ],
    ));
  }
}
