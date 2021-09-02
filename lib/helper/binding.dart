import 'package:ecommerceapp/core/viewmodels/auth_view_model.dart';
import 'package:ecommerceapp/core/viewmodels/cart_view_model.dart';
import 'package:ecommerceapp/core/viewmodels/control_view_model.dart';
import 'package:ecommerceapp/core/viewmodels/home_view_model.dart';
import 'package:ecommerceapp/helper/local_storage_data.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
    //Get.lazyPut(() => ProfileViewModel());
    Get.lazyPut(() => LocalStorageData());
  }
}
