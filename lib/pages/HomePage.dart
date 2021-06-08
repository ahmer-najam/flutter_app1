import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app1/models/ProductModel.dart';
import 'package:flutter_app1/widgets/Drawer.dart';
import 'package:flutter_app1/widgets/ProductItemWidget.dart';

class HomePage extends StatefulWidget {
  // const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dummyList = List.generate(50, (index) => products[0]);

// initState calls before build
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    Product.formMap(map) = List.from(productsData)
        .map<Product>((product) => Product.formMap(product))
        .toList();
    print(productsData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalogue App"),
      ),
      body: ListView.builder(
        // itemCount: products.length,
        itemCount: dummyList.length,
        itemBuilder: (context, index) {
          // return ProductItemWidget(product: products[index]);
          return ProductItemWidget(product: dummyList[index]);
        },
      ),
      drawer: MyDarwer(),
    );
  }
}
