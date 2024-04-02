import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/prodectModel.dart';

class AddProduct {
  Future<ProductModel> addProduct(
      {required String title,
      required String price,
      required String image,
      required String description,
      required String Category}) async {
    Map<String, dynamic> data = await Api().post(
      Url: 'https://fakestoreapi.com/products',
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

// 'title': , 
// 'price': , 
// 'description' : ,
// 'image': ,
// 'category' : ,