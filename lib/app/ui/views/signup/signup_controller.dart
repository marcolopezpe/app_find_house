import 'package:app_find_house/app/data/models/request/request_signup_model.dart';
import 'package:app_find_house/app/data/repositories/customer_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  @override
  void onInit() {
    crtlTextName = TextEditingController();
    crtlTextLastName = TextEditingController();
    crtlTextAddress = TextEditingController();
    crtlTextEmail = TextEditingController();
    crtlTextPassword = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  // Instances
  final _customerRepository = Get.find<CustomerRepository>();

  // Variables
  late TextEditingController crtlTextName;
  late TextEditingController crtlTextLastName;
  late TextEditingController crtlTextAddress;
  late TextEditingController crtlTextEmail;
  late TextEditingController crtlTextPassword;

  // Functions
  void goToLogin() {
    Get.back();
  }

  void clearCtrlText() {
    crtlTextLastName.clear();
    crtlTextName.clear();
    crtlTextAddress.clear();
    crtlTextEmail.clear();
    crtlTextPassword.clear();
  }

  Future<void> signUp() async {
    try {
      final response = await _customerRepository.signup(RequestSignUpModel(
        name: crtlTextName.text,
        lastname: crtlTextLastName.text,
        adress: crtlTextAddress.text,
        email: crtlTextEmail.text,
        password: crtlTextPassword.text,
      ));

      Get.snackbar(
        "Estado de registro",
        response.message,
        snackPosition: SnackPosition.BOTTOM,
      );

      clearCtrlText();
    } catch (error) {
      Get.snackbar(
        "Error de registro",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
