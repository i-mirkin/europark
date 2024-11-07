class Category {
  int? id;
  int? categoryId;
  String? name;
  String? imgSrc;
  String? description;

  Category.fromMap(Map<dynamic, dynamic> map) {
    id = int.parse(map['id']);
    categoryId = int.parse(map['category_id']);
    name = map['name'];
    imgSrc = map['img_src'];
    description = map['description'];
  }
}