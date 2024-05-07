import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/controller.dart';
import '../../../helper/constants.dart';
import '../../../models/category_model.dart';
import '../../../util/category_data_source.dart';

class ListCategoryTablet extends StatefulWidget {
  const ListCategoryTablet({super.key});

  @override
  State<ListCategoryTablet> createState() => _ListCategoryMobileState();
}

class _ListCategoryMobileState extends State<ListCategoryTablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      backgroundColor: myDefaultBackground,
      drawer: myDrawer,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetX<Controller>(
          init: Controller(),
          builder: (categoryController) {
            if (categoryController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return SizedBox(
                height: 570,
                width: double.infinity,
                child: _buildCategoryList(categoryController.categories),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: "Ajouter une catégorie",
          backgroundColor: Colors.grey[900],
          child: const Icon(Icons.add, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pushNamed("/add-category");
          }),
    );
  }

  Widget _buildCategoryList(List<Category> categories) {
    return SingleChildScrollView(
      child: PaginatedDataTable(
        header: const Text('Categories'),
        rowsPerPage: 8,
        columns: const [
          DataColumn(label: Text('Image')),
          DataColumn(label: Text('Name')),
          DataColumn(
              label: Text(
            'Actions',
            textAlign: TextAlign.center,
          )),
        ],
        source: CategoryDataSource(categories),
      ),
    );
  }
}
