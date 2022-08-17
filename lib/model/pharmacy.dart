class Pharmacy {
  Pharmacy({this.id, this.name, this.photo, this.location, this.products});

  int? id;
  String? name;
  String? photo;
  String? location;
  List<Product>? products;

  factory Pharmacy.fromJson(Map<String, dynamic> json) => Pharmacy(
        id: json["id"],
        name: json["name"],
        photo: json["photo"],
        location: json["location"],
        products:
            List<Product>.from(json["products"].map((x) => Product.fromJson(x)))
                .cast(),
      );
}

class Product {
  Product({
    this.id,
    this.name,
    this.photo,
    this.count,
  });

  int? id;
  String? name;
  String? photo;
  int? count;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        photo: json["photo"],
        count: json["count"],
      );
}
