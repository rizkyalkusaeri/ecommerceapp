import 'package:ecommerceapp/view/cart_view.dart';
import 'package:ecommerceapp/view/home_view.dart';
import 'package:ecommerceapp/view/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;
  Widget _currentScreen = HomeView();

  get currentScreen => _currentScreen;
  get navigatorValue => _navigatorValue;

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          _currentScreen = HomeView();
          break;
        }
      case 1:
        {
          _currentScreen = CartView();
          break;
        }
      case 2:
        {
          _currentScreen = ProfileView();
          break;
        }
    }
    update();
  }
}
