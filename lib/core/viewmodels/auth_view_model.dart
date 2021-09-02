import 'package:ecommerceapp/core/services/firestore_user.dart';
import 'package:ecommerceapp/helper/local_storage_data.dart';
import 'package:ecommerceapp/model/user_model.dart';
import 'package:ecommerceapp/view/control_view.dart';
import 'package:ecommerceapp/view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();

  String email, password, name;

  Rx<User> _user = Rx<User>();

  String get user => _user.value?.email;

  final LocalStorageData localStorageData = Get.find();

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    print(googleUser);

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    try {
      await _auth.signInWithCredential(credential).then((user) async {
        var currentUser = await FireStoreUser().getCurrentUser(user.user.uid);
        if (currentUser == null) {
          saveUser(user);
          currentUser.data().forEach((key, value) {
            setUser(value);
          });
        } else {
          currentUser.data().forEach((key, value) {
            setUser(value);
          });
        }
        Get.offAll(ControlView());
      });
    } catch (e) {
      print(e.message);
      Get.snackbar('Error Login Account', e.message,
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void facebookSignInMethod() async {
    FacebookLoginResult result = await _facebookLogin.logIn(['email']);

    if (result.status == FacebookLoginStatus.loggedIn) {
      print(result);
      final accessToken = result.accessToken.token;
      final faceCredential = FacebookAuthProvider.credential(accessToken);

      try {
        await _auth.signInWithCredential(faceCredential).then((user) async {
          var currentUser = await FireStoreUser().getCurrentUser(user.user.uid);
          if (currentUser == null) {
            saveUser(user);
            setUser(UserModel.fromJson(currentUser.data()));
          } else {
            setUser(UserModel.fromJson(currentUser.data()));
          }
          Get.offAll(ControlView());
        });
      } catch (e) {
        print(e.message);
        Get.snackbar('Error Login Account', e.message,
            colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
      }
    }
  }

  void signInWithEmailandPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await FireStoreUser()
            .getCurrentUser(value.user.uid)
            .then((value) => {setUser(UserModel.fromJson(value.data()))});
      });
      Get.offAll(ControlView());
    } catch (e) {
      print(e.message);
      Get.snackbar('Error Login Account', e.message,
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signUpWithEmailandPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveUser(user);
      });

      Get.offAll(HomeView());
    } catch (e) {
      print(e.message);
      Get.snackbar('Error Login Account', e.message,
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
        userId: user.user.uid,
        email: user.user.email,
        name: name == null ? user.user.displayName : name,
        pic: '');

    await FireStoreUser().addUserToFireStore(userModel);
    setUser(userModel);
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }
}
