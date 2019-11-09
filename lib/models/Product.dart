class Product {
  final int id;
  final String name;
  final int price;

  Product(this.id, this.name, this.price);

  Product.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        price = json["price"];
}
