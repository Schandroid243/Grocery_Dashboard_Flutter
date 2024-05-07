import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/config.dart';
import '../controller/controller.dart';
import '../models/slider_model.dart';

class SliderDataSource extends DataTableSource {
  final List<Sliders> _sliders;

  SliderDataSource(this._sliders);

  @override
  DataRow? getRow(int index) {
    if (index >= _sliders.length) {
      return null;
    }
    final slider = _sliders[index];
    return DataRow(cells: [
      DataCell(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 60,
            height: 60,
            child: Image.network(Config.imageUrl + slider.sliderImage),
          ),
        ),
      ),
      DataCell(Text(slider.sliderName)),
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
              Get.find<Controller>().deleteSlider(slider.sliderId);
            },
          ),
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _sliders.length;

  @override
  int get selectedRowCount => 0;
}
