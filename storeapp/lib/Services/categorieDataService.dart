import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/prodectModel.dart';

class CategoriesDataService {
  Future<List<ProductModel>> getAllCategoryData(
      {required String category_name}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$category_name');

    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
    }
    return productList;

    // http.Response response = await http.get(
    //     Uri.parse('https://fakestoreapi.com/products/category/$category_name'));
    // if (response.statusCode == 200) {
    // List<dynamic> data = jsonDecode(response.body);

    // } else {
    //   throw Exception('there is problem with dtatus code ');
    // }
  }
}
