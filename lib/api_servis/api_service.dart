import 'package:dio/dio.dart';
import 'package:rxtdart/model/defaanation_model.dart';
import 'package:rxtdart/model/universal_data.dart';

class ApiService {
  final Dio dio = Dio();

  Future<UniversalData> postDefination({required String defination}) async {
    Response response = await dio
        .get('https://api.dictionaryapi.dev/api/v2/entries/en/$defination');
    try {
      if (response.statusCode == 200) {
        return UniversalData(
            data: DefinationModel.getFromList(response.data as List?));
      }
      return UniversalData(error: 'Other Error');
    } on DioException {
      return UniversalData();
    }
  }
}
