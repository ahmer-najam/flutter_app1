import 'package:flutter/material.dart';
import 'package:flutter_app1/models/ProductModel.dart';

class ProductItemWidget extends StatelessWidget {
  // const ProductItemWidget({Key? key}) : super(key: key);
  final Product product;

  const ProductItemWidget({Key? key, required this.product})
      : assert(product != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        shape: StadiumBorder(),
        child: ListTile(
          onTap: () => {print("${product.name} pressed")},
          leading: Image.network(product.image),
          title: Text(product.name),
          subtitle: Text(product.desc),
          trailing: Text(
            "\$${product.price.toString()}",
            textScaleFactor: 1.5,
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),
          ),
        ),
      ),
    );
  }
}
