import 'dart:convert';

import 'package:app_find_house/app/data/models/request/request_information_model.dart';
import 'package:app_find_house/app/data/models/response/response_auth_model.dart';
import 'package:app_find_house/app/data/models/response/response_house_model.dart';
import 'package:app_find_house/app/data/models/response/response_information_model.dart';
import 'package:app_find_house/app/data/repositories/customer_repository.dart';
import 'package:app_find_house/app/data/repositories/house_repository.dart';
import 'package:app_find_house/app/routes/app_routes.dart';
import 'package:app_find_house/app/services/local_storage_service.dart';
import 'package:app_find_house/core/utils/keys.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
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
    initialize();
    super.onReady();
  }

  // Intances
  final _customerRepository = Get.find<CustomerRepository>();
  final _houseRepository = Get.find<HouseRepository>();

  ResponseAuthModel responseAuthModel = ResponseAuthModel(
    idUser: 0,
    requestToken: "",
  );
  ResponseInformationModel informationUser = ResponseInformationModel();

  // Variables
  RxString userFullName = RxString("");
  RxString address = RxString("");
  RxInt isSelectedIndex = RxInt(0);
  RxBool isLoadingHouses = RxBool(false);
  RxList<ResultHouseModel> houses = RxList([]);

  // Functions
  void initialize() async {
    String value = await LocalStorageService.get(Keys.keyAuthUser);

    if (value.isNotEmpty) {
      responseAuthModel = ResponseAuthModel.fromJson(json.decode(value));

      informationUser =
          await _customerRepository.getInformation(RequestInformationModel(
        idUser: responseAuthModel.idUser,
        requestToken: responseAuthModel.requestToken,
      ));

      userFullName.value =
          "${informationUser.information?[0].name} ${informationUser.information?[0].lastname}";

      address.value = "${informationUser.information?[0].address}";

      loadHouses();
    }
  }

  void loadHouses() async {
    try {
      isLoadingHouses.value = true;
      final response = await _houseRepository.getHouses(
        responseAuthModel.requestToken,
      );

      houses.value = response.result ?? [];

      isLoadingHouses.value = false;
    } catch (error) {
      printError(info: error.toString());
    }
  }

  void selectedIndex(int index) {
    isSelectedIndex.value = index;
  }

  void signOut() {
    LocalStorageService.delete(Keys.keyAuthUser);
    LocalStorageService.delete(Keys.keyUserEmail);
    LocalStorageService.delete(Keys.keyUserPass);
    Get.offNamed(AppRoutes.LOGIN);
  }
}
