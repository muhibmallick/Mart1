class Product {
  int? _totalSize;
  int? _typeld;
  int? _offset;
  late List<ProductModel> _products;
  List<ProductModel> get products => _products;
  Product(
      {required totalSize,
      required typeld,
      required offset,
      required products}) {
    this._totalSize = totalSize;
    this._typeld = typeld;
    this._offset = offset;
    this._products = products;
  }

  Product.fromJason(Map<String, dynamic> json) {
    _typeld = json['type_id'];
    _totalSize = json['total _ size'];
    _offset = json['offset'];

    if (json['products'] != null) {
      _products = <ProductModel>[];
      json['products'].forEach((v) {
        _products.add(ProductModel.fromJason(v));
      });
    }
  }
}

class ProductModel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? createdAt;
  String? updatedAt;
  int? typeld;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.stars,
    this.img,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.typeld,
  });

  ProductModel.fromJason(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    img = json['img'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    typeld = json['type_id'];
  }
}
