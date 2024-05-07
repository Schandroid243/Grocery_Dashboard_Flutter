import 'package:e_commerce_dashboard/models/article_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/config.dart';
import '../controller/controller.dart';

class ArticleDataSource extends DataTableSource {
  final List<Articles> _articles;
  final Function _goTo;
  final Function _articleInfo;
  final Controller articleController = Get.find<Controller>();

  ArticleDataSource(this._articles, this._goTo, this._articleInfo);

  @override
  DataRow? getRow(int index) {
    if (index >= _articles.length) {
      return null;
    }
    final article = _articles[index];
    return DataRow(cells: [
      DataCell(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 60,
            height: 60,
            child: Image.network(Config.imageUrl + article.productImage),
          ),
        ),
      ),
      DataCell(Text(article.productName)),
      DataCell(Text(article.category.categoryName)),
      DataCell(Text(article.stockStatus!)),
      DataCell(Text(article.productPrice.toString())),
      DataCell(Text(article.productSalePrice.toString())),
      DataCell(Text(article.productType!)),
      DataCell(Row(
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Trigger action to edit the category
              // You can implement the edit functionality here
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              // Trigger action to delete the category
              // You can implement the delete functionality here
              Get.find<Controller>().deleteArticle(
                  article.productId!); //Create a delete method for articles
            },
          ),
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              // Trigger action to edit the category
              // You can implement the edit functionality here
              articleController.getArticleForRelatedProduct(article);
              _articleInfo();
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              articleController.getArticleForRelatedProduct(article);
              _goTo();
            },
          )
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _articles.length;

  @override
  int get selectedRowCount => 0;
}
