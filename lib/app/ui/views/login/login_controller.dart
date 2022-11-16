import 'dart:convert';

import 'package:app_find_house/app/data/models/request/request_auth_model.dart';
import 'package:app_find_house/app/data/repositories/customer_repository.dart';
import 'package:app_find_house/app/routes/app_routes.dart';
import 'package:app_find_house/app/services/local_storage_service.dart';
import 'package:app_find_house/core/utils/keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    ctrlTextEmail = TextEditingController();
    ctrlTextPassword = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    ctrlTextEmail.dispose();
    ctrlTextPassword.dispose();
    super.onClose();
  }

  // Instances
  final _customerRepository = Get.find<CustomerRepository>();

  // Variables
  // String email = "gqcrispin@gmail.com";
  // String password = "123456";
  String email = "";
  String password = "";
  late TextEditingController ctrlTextEmail;
  late TextEditingController ctrlTextPassword;

  // Functions
  Future<void> doAuth() async {
    try {
      final response = await _customerRepository.postAuth(
        RequestAuthModel(
          email: email,
          password: password,
        ),
      );

      if (response.requestToken.isNotEmpty) {
        await LocalStorageService.set(
          key: Keys.keyUserEmail,
          value: email,
        );

        await LocalStorageService.set(
          key: Keys.keyUserPass,
          value: password,
        );

        await LocalStorageService.set(
          key: Keys.keyAuthUser,
          value: json.encode(response.toJson()),
        );

        Get.offNamed(AppRoutes.HOME);
      }
    } catch (error) {
      print("Error -> $error");
    }
  }

  void goToSignUp() {
    Get.toNamed(AppRoutes.SIGNUP);
  }
}
