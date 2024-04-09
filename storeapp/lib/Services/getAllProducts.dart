import 'package:storeapp/helper/api.dart';
// import 'package:http/http.dart' as http;
import 'package:storeapp/models/prodectModel.dart';

class GetAllPrductsService {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');
    print('gettttttttttttttttttt');
    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return productsList;
  }
}
