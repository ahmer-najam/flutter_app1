import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app1/models/ProductModel.dart';
import 'package:flutter_app1/widgets/Drawer.dart';
import 'package:flutter_app1/widgets/ProductItemWidget.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  // const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final dummyList = List.generate(50, (index) => products[0]);

// initState calls before build
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 1));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    Product.products = List.from(productsData)
        .map<Product>((product) => Product.fromMap(product))
        .toList();
    // print(Product.products);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalogue App"),
      ),
      body: (Product.products != null && Product.products.isNotEmpty)
          ? GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
              itemBuilder: (context, index) {
                final product = Product.products[index];
                return Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), 
                  child:GridTile(
                    header: Container(child: Text(product.name, style: TextStyle(color: Colors.white),), padding: EdgeInsets.all(15), decoration: BoxDecoration(color: Colors.blueGrey),),
                    child: Image.network(product.image),
                    footer: Text(product.price.toString())
                    ));
              },
              itemCount: Product.products.length,
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      drawer: MyDarwer(),
    );
  }
}
