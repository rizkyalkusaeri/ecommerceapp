import 'package:ecommerceapp/constant.dart';
import 'package:ecommerceapp/core/viewmodels/auth_view_model.dart';
import 'package:ecommerceapp/view/auth/register_view.dart';
import 'package:ecommerceapp/view/widgets/custom_button.dart';
import 'package:ecommerceapp/view/widgets/custom_button_social.dart';
import 'package:ecommerceapp/view/widgets/custom_text.dart';
import 'package:ecommerceapp/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0.0, backgroundColor: Colors.white),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Welcome",
                      fontSize: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(RegisterView());
                      },
                      child: CustomText(
                        text: "Sign up",
                        color: primaryColor,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "Sign in to Continue",
                  fontSize: 14,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    CustomTextFormField(
                      text: "Email",
                      hint: "rizkyalkus12@gmail.com",
                      onSave: (value) {
                        controller.email = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Please insert email";
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      text: "Password",
                      hint: "********",
                      onSave: (value) {
                        controller.password = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Please insert password";
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                        text: "Forgot Password ?",
                        fontSize: 14,
                        alignment: Alignment.topRight),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      onPressed: () {
                        final form = _formKey.currentState;
                        if (form.validate()) {
                          form.save();
                          controller.signInWithEmailandPassword();
                        }
                      },
                      text: 'SIGN IN',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: '-OR-',
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButtonSocial(
                      text: 'Sign in with Google',
                      imageName: 'search.png',
                      onPressed: () {
                        controller.googleSignInMethod();
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButtonSocial(
                      text: 'Sign in with Facebook',
                      imageName: 'facebook.png',
                      onPressed: () {
                        controller.facebookSignInMethod();
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
