import 'dart:developer';

import 'package:get/get.dart';
import 'package:product/view/bottom_bar_icon_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController implements GetxService {
  // final SharedPreferences sharedPreference;

  // AuthController(this.sharedPreference, this.userName, this.password);

  String? userName;
  String? password;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode userNameNode = FocusNode();
  FocusNode passwordNode = FocusNode();

  static var widget;

  @override
  void onInit() {
    userNameNode = FocusNode();
    passwordNode = FocusNode();
    super.onInit();
  }

  @override
  void onClose() {
    userNameNode.dispose();
    passwordNode.dispose();

    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  validateUserName(String value) {
    if (value.isNotEmpty) {
      return null;
    } else {
      return 'Please fill something';
    }
  }

  setUseName(val) {
    userName = val;
    update();
  }

  setPassword(val) {
    password = val;
    update();
  }

  validatepassword(String value, context) {
    if (value.isNotEmpty) {
      if (value.length >= 6) {
        return null;
      } else {
        return 'Your password must be atlest 6 character';
      }
    } else {
      return 'please fill something';
    }
  }
}
