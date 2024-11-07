class Product {
  int? id;
  int? productId;
  String? name;
  String? imgSrc;
  String? imgSrcLarge;
  int? price;
  String? description;
  String? company;

  Product({
    required this.id,
    required this.productId,
    required this.name,
    required this.imgSrc,
    required this.imgSrcLarge,
    required this.price,
    required this.description,
    required this.company,
  });


  Product.fromMap(Map<dynamic, dynamic> map) {
    id = map['id'];
    productId = int.parse(map['product_id']);
    name = map['name'];
    imgSrc = map['img_src'];
    imgSrcLarge = map['img_src_large'];
    price = int.parse(map['price']);
    description = map['description'] ?? '';
    company = map['company'] ?? '';
  }
}