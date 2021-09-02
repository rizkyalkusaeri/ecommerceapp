import 'package:ecommerceapp/core/viewmodels/auth_view_model.dart';
import 'package:ecommerceapp/view/auth/login_view.dart';
import 'package:ecommerceapp/view/widgets/custom_button.dart';
import 'package:ecommerceapp/view/widgets/custom_text.dart';
import 'package:ecommerceapp/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.off(LoginView());
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                CustomText(
                  text: "Sign up",
                  fontSize: 30,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "Please Fill Correctly",
                  fontSize: 14,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    CustomTextFormField(
                      text: "Name",
                      hint: "rizkyalkusaeri",
                      onSave: (value) {
                        controller.name = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Please insert Name";
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                    CustomButton(
                      onPressed: () {
                        final form = _formKey.currentState;
                        if (form.validate()) {
                          form.save();
                          controller.signUpWithEmailandPassword();
                        }
                      },
                      text: 'SIGN UP',
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
