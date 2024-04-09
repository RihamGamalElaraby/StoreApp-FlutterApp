import 'package:flutter/material.dart';
import 'package:storeapp/models/prodectModel.dart';
import 'package:storeapp/screens/updateProductPage.dart';

class CustomCard extends StatelessWidget {
  CustomCard({super.key, required this.model});
  ProductModel model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdatePage.id, arguments: model);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            // height: 170,
            // width: 200,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 20,
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  offset: Offset(10, 10)),
            ]),
            child: Card(
              elevation: 70,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${model.title}',
                      style: TextStyle(
                        color: Colors.grey,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' '${model.price}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Icon(Icons.favorite),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -50,
            right: 0,
            child: Image.network(
              '${model.image}',
              height: 70,
              width: 90,
            ),
          ),
        ],
      ),
    );
  }
}
