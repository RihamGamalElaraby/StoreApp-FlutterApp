import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/prodectModel.dart';

class UpdateProduct {
  Future<ProductModel> updateProduct(
      {required String title,
      required String price,
      required String image,
      required String description,
      required int id,
      required String Category}) async {
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': image,
      },
    );
    return ProductModel.fromJson(data);
  }
}
