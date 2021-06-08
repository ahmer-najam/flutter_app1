import 'dart:convert';

class Product {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  // static List<Product> products = [];

  Product(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

  

  // Product(
  //     {this.id = "",
  //     this.name = "",
  //     this.desc = "",
  //     this.price = 0,
  //     this.color = "",
  //     this.image = ""});
  static List<Product> products = [
    Product(
        id: 0,
        name: "iPhone 12 Pro",
        desc: "Apple iPhone 12th generation",
        price: 999,
        color: "#33505a",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc")
  ];

  Product copyWith({
    int? id,
    String? name,
    String? desc,
    num? price,
    String? color,
    String? image,
  }) {
    return Product(
      id: this.id,
      name : this.name,
      desc : this.desc,
      price : this.price,
      color : this.color,
      image : this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Product &&
      other.id == id &&
      other.name == name &&
      other.desc == desc &&
      other.price == price &&
      other.color == color &&
      other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      desc.hashCode ^
      price.hashCode ^
      color.hashCode ^
      image.hashCode;
  }
}

