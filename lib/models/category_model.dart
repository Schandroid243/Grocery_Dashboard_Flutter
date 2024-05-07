List<Category> categoriesFromJson(dynamic str) =>
    List<Category>.from((str).map((x) => Category.fromJson(x)));

class Category {
  final String categoryName;
  final String categoryImage;
  final String categoryId;

  Category({
    required this.categoryName,
    required this.categoryImage,
    required this.categoryId,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryName: json['categoryName'],
      categoryImage: json['categoryImage'],
      categoryId: json['categoryId'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['categoryId'] = categoryId;
    _data['categoryName'] = categoryName;
    _data['categoryImage'] = categoryImage;
    return _data;
  }
}
