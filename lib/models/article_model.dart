import 'package:e_commerce_dashboard/models/category_model.dart';

List<Articles> productsFromJson(dynamic str) =>
    List<Articles>.from((str).map((x) => Articles.fromJson(x)));

class Articles {
  final String productName;
  final Category category;
  final String? productShortDescription;
  final double productPrice;
  final double productSalePrice;
  final String productImage;
  final String? productSKU;
  final String? productType;
  final String? stockStatus;
  List<String>? relatedProducts;
  String? productId;

  Articles({
    required this.productName,
    required this.category,
    this.productShortDescription,
    required this.productPrice,
    required this.productSalePrice,
    required this.productImage,
    this.productSKU,
    this.productType,
    this.stockStatus,
    this.relatedProducts,
    this.productId,
  });

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      productName: json['productName'],
      category: Category.fromJson(json['category']),
      productShortDescription: json['productShortDescription'],
      productPrice: json['productPrice'],
      productSalePrice: json['productSalePrice'],
      productImage: json['productImage'],
      productSKU: json['productSKU'],
      productType: json['productType'],
      stockStatus: json['stockStatus'],
      relatedProducts: json['relatedProducts'] != null
          ? List<String>.from(json['relatedProducts'])
          : null,
      productId: json['productId'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['productId'] = productId;
    _data['productName'] = productName;
    _data['category'] = category.toJson();
    _data['productShortDescription'] = productShortDescription;
    _data['productPrice'] = productPrice;
    _data['productSalePrice'] = productSalePrice;
    _data['productImage'] = productImage;
    _data['productSKU'] = productSKU;
    _data['productType'] = productType;
    _data['stockStatus'] = stockStatus;
    _data['relatedProducts'] = relatedProducts;
    return _data;
  }
}
