class CategoryModel {
  const CategoryModel({required this.id, required this.name});
  final String name;
  final int id;

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
