import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodly_app/constants/constants.dart';
import 'package:foodly_app/models/api_error.dart';
import 'package:foodly_app/models/categories.dart';
import 'package:foodly_app/models/hook_model/hook_result.dart';
import 'package:http/http.dart' as http;

FetchHook useFetchCategories() {
  final CategoriesItems = useState<List<CategoryModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;

    try {
      Uri url = Uri.parse('$baseUrl/api/category/random');
      final response = await http.get(url);
      print(response.statusCode);

      if (response.statusCode == 200) {
        CategoriesItems.value = categoryModelFromJson(response.body);
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
      error.value = e as Exception;
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchHook(
    data: CategoriesItems.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
