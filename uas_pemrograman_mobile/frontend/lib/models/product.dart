class ProductModel {
  const ProductModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.tag,
      required this.category});

  final String name, tag, category, image;
  final int id, price;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      tag: json['tag'],
      image: json['image'],
      category: json['category'],
    );
  }
}
