import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storeapp/Services/getAllProducts.dart';
import 'package:storeapp/models/prodectModel.dart';
import 'package:storeapp/widgets/productCard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'homePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(FontAwesomeIcons.cartShopping),
            )
          ],
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'New Trend',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 50),
              child: FutureBuilder<List<ProductModel>>(
                future: GetAllPrductsService().getAllProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    List<ProductModel> products = snapshot.data!;
                    return GridView.builder(
                      itemCount: products.length,
                      clipBehavior: Clip.none,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 70,
                      ),
                      itemBuilder: (context, index) {
                        return CustomCard(
                          model: products[index],
                        );
                      },
                    );
                  } else {
                    return Text('No data available');
                  }
                },
              )),
        ));
  }
}
