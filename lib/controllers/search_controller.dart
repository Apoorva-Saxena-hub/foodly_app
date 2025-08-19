import 'package:foodly_app/constants/constants.dart';
import 'package:foodly_app/models/api_error.dart';
import 'package:foodly_app/models/food.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;

class SearchFoodController extends GetxController {
  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool value) {
    _isLoading.value = value;
  }

  RxBool _isTrigger = false.obs;

  bool get isTrigger => _isLoading.value;

  set setTrigger(bool value) {
    _isLoading.value = value;
  }

  List<FoodsModel>? SearchResults;

  Future<void> searchFoods(String key) async {
    setLoading = true;
    Uri url = Uri.parse("$baseUrl/api/foods/search/$key");

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        SearchResults = foodsModelFromJson(response.body);
        setLoading = false;
      } else {
        setLoading = false;
        var error = apiErrorFromJson(response.body);
      }
    } catch (e) {
      setLoading = false;
      print(e.toString());
    }
  }
}
