import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/config.dart';
import '../controller/controller.dart';
import '../models/category_model.dart';

class CategoryDataSource extends DataTableSource {
  final List<Category> _categories;

  CategoryDataSource(this._categories);

  @override
  DataRow? getRow(int index) {
    if (index >= _categories.length) {
      return null;
    }
    final category = _categories[index];
    return DataRow(cells: [
      DataCell(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 60,
            height: 60,
            child: Image.network(Config.imageUrl + category.categoryImage),
          ),
        ),
      ),
      DataCell(Text(category.categoryName)),
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
              Get.find<Controller>().deleteCategory(category.categoryId);
            },
          ),
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _categories.length;

  @override
  int get selectedRowCount => 0;
}
