import 'package:ecommerceapp/helper/local_storage_data.dart';
import 'package:ecommerceapp/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController {
  final LocalStorageData localStorageData = Get.find();

  UserModel _userModel;

  UserModel get userModel => _userModel;

  ProfileViewModel() {
    getCurrentUser();
  }

  Future<void> getCurrentUser() async {
    await localStorageData.getUser.then((value) => _userModel = value);
    update();
  }

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();

    update();
  }
}
