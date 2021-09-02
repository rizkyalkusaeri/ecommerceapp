import 'package:ecommerceapp/core/viewmodels/auth_view_model.dart';
import 'package:ecommerceapp/core/viewmodels/control_view_model.dart';
import 'package:ecommerceapp/view/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginView()
          : GetBuilder<ControlViewModel>(
              init: ControlViewModel(),
              builder: (controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: _bottomNavigationBar(),
              ),
            );
    });
  }

  Widget _bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: Get.find(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Text("Explore"),
              ),
              icon: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Icon(
                  Icons.explore,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Text("Cart"),
            ),
            icon: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Icon(
                Icons.shopping_cart,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Text("Account"),
            ),
            icon: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Icon(
                Icons.account_circle_rounded,
              ),
            ),
            label: '',
          ),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
        elevation: 0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
      ),
    );
  }
}
