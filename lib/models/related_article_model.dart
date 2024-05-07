class RelatedProduct {
  final String articleId; // New field for the ID of the related article

  RelatedProduct({
    required this.articleId,
  });

  factory RelatedProduct.fromJson(Map<String, dynamic> json) {
    return RelatedProduct(
      articleId: json['articleId'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['articleId'] = articleId;
    return _data;
  }
}
