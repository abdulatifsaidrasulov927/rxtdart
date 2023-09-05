import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:rxtdart/api_servis/api_service.dart';
import 'package:rxtdart/model/defaanation_model.dart';
import 'package:rxtdart/model/universal_data.dart';

class DefinationController extends GetxController {
  DefinationController({required this.apiService});

  final ApiService apiService;

  var isLoading = false.obs;
  RxList<DefinationModel> defination = <DefinationModel>[].obs;

  getDefination({required String word}) async {
    isLoading.value = true;
    UniversalData loadDefination =
        await apiService.postDefination(defination: word);
    isLoading.value = false;
    if (loadDefination.error.isEmpty) {
      print('ISHLADI');
      defination.value = loadDefination.data;
      Get.snackbar(
          'Hi', defination.first.meanings!.first.definitions.first.definition);
    } else {
      Get.snackbar('Hi', 'ERROR');
      isLoading.value = false;
    }
    print('ISHLAMADI');
  }
}
