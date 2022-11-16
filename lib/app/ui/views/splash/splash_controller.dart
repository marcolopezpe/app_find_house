import 'dart:convert';

import 'package:app_find_house/app/data/models/request/request_auth_model.dart';
import 'package:app_find_house/app/data/repositories/customer_repository.dart';
import 'package:app_find_house/app/routes/app_routes.dart';
import 'package:app_find_house/app/services/local_storage_service.dart';
import 'package:app_find_house/core/utils/keys.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 1), () {
      // 2 formas de navegar:
      // - Get.to/Get.toNamed: Llama a la vista, y se puede regresar a esta pantalla
      // - Get.off/Get.offNamed: Llama a la vista, pero destruye esta pantalla de memoria
      doAuth();
    });
    super.onReady();
  }

  // Instances
  final _customerRepository = Get.find<CustomerRepository>();

  // Functions
  Future<void> doAuth() async {
    try {
      String email = await LocalStorageService.get(Keys.keyUserEmail);
      String password = await LocalStorageService.get(Keys.keyUserPass);

      if (email.isNotEmpty && password.isNotEmpty) {
        final response = await _customerRepository.postAuth(
          RequestAuthModel(
            email: email,
            password: password,
          ),
        );

        if (response.requestToken.isNotEmpty) {
          await LocalStorageService.set(
            key: Keys.keyAuthUser,
            value: json.encode(response.toJson()),
          );

          Get.offNamed(AppRoutes.HOME);
        } else {
          Get.offNamed(AppRoutes.LOGIN);
        }
      } else {
        Get.offNamed(AppRoutes.LOGIN);
      }
    } catch (error) {
      print("Error -> $error");
    }
  }
}
