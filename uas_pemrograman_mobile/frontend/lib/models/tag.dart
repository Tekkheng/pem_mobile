class TagModel {
  const TagModel({required this.id, required this.name});
  final String name;
  final int id;

  factory TagModel.fromJson(Map<String, dynamic> json) {
    return TagModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
