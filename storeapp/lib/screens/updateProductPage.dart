import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/Services/updateProduct.dart';
import 'package:storeapp/models/prodectModel.dart';
import 'package:storeapp/widgets/customButton.dart';
import 'package:storeapp/widgets/customTextField.dart';

class UpdatePage extends StatefulWidget {
  UpdatePage({super.key});
  static String id = 'updatePage';

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  String? productname, desc, image;

  String? price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Update Product',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DefultCustomTextFormField(
                    onChanged: (data) {
                      productname = data;
                    },
                    hintText: 'Product Name',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DefultCustomTextFormField(
                    hintText: 'Description',
                    onChanged: (data) {
                      desc = data;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DefultCustomTextFormField(
                    hintText: 'Price',
                    onChanged: (data) {
                      price = data;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DefultCustomTextFormField(
                    hintText: 'Image',
                    onChanged: (data) {
                      image = data;
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: CustomButton(
                        onTap: () async {
                          isLoading = true;
                          setState(() {});
                          try {
                            await UpdateProductmini(productModel);
                            print('sucsses');
                          } on Exception catch (e) {
                            isLoading = false;
                            setState(() {});
                            // TODO
                          }
                          isLoading = false;
                          setState(() {});
                        },
                        text: 'Update'),
                  )
                ],
              ),
            ),
          )),
    );
  }

  Future<void> UpdateProductmini(ProductModel product) async {
    UpdateProduct().updateProduct(
        id: product.id,
        title: productname == null ? product.title : productname!,
        price: price == null ? product.price.toString() : price!,
        image: image == null ? product.image : image!,
        description: desc == null ? product.description : desc!,
        Category: product.category);
  }
}
