import 'package:ecommerceapp/core/viewmodels/profile_view_model.dart';
import 'package:ecommerceapp/view/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => Scaffold(
        body: Container(
          child: TextButton(
            onPressed: () {
              controller.signOut();
              Get.offAll(LoginView());
            },
            child: Text("Sign Out"),
          ),
        ),
      ),
    );
  }
}
