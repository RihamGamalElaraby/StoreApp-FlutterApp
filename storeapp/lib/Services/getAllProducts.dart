import 'package:storeapp/helper/api.dart';
// import 'package:http/http.dart' as http;
import 'package:storeapp/models/prodectModel.dart';

class GetAllPrductsService {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(Url: 'https://fakestoreapi.com/products');

    // List<dynamic> data = jsonDecode(response.body);
    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
    }
    return productList;
    // http.Response response =
    //     await http.get(Uri.parse('https://fakestoreapi.com/products'));
    // if (response.statusCode == 200) {
    //   List<dynamic> data = jsonDecode(response.body);
    //   List<ProductModel> productList = [];
    //   for (int i = 0; i < data.length; i++) {
    //     productList.add(ProductModel.fromJson(data[i]));
    //   }
    //   return productList;
    // } else {
    //   throw Exception('there is problem with dtatus code ');
    // }
  }
}
