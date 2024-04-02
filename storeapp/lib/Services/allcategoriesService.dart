import 'package:storeapp/helper/api.dart';

class CategoriesService {
  Future<List<dynamic>> getallCategories() async {
    List<dynamic> data =
        await Api().get(Url: 'https://fakestoreapi.com/products/categories');
    return data;

    // http.Response response = await http
    //     .get(Uri.parse('https://fakestoreapi.com/products/categories'));
    // if (response.statusCode == 200) {
    //   List<dynamic> data = jsonDecode(response.body);
    //   return data;
    // } else {
    //   throw Exception('there is problem with dtatus code ');
    // }
  }
}
