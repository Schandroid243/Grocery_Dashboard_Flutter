import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/controller.dart';
import '../../../helper/constants.dart';
import '../../../models/article_model.dart';
import '../../../util/article_data_source.dart';

class ListArticleMobile extends StatefulWidget {
  const ListArticleMobile({super.key});

  @override
  State<ListArticleMobile> createState() => _ListArticleMobileState();
}

class _ListArticleMobileState extends State<ListArticleMobile> {
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
          builder: (articleController) {
            if (articleController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return SizedBox(
                height: 700,
                width: double.infinity,
                child: _buildArticleList(articleController.articles),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: "Ajouter un article",
          backgroundColor: Colors.grey[900],
          child: const Icon(Icons.add, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pushNamed("/add-article");
          }),
    );
  }

  Widget _buildArticleList(List<Articles> articles) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey[300],
        child: PaginatedDataTable(
          header: const Text('Articles'),
          rowsPerPage: 8,
          columns: const [
            DataColumn(
              label: Text(
                'Image',
              ),
            ),
            DataColumn(
              label: Text(
                'Name',
              ),
            ),
            DataColumn(
              label: Text(
                'Categorie',
              ),
            ),
            DataColumn(
              label: Text(
                'Stock',
              ),
            ),
            DataColumn(
              label: Text(
                'Prix',
              ),
            ),
            DataColumn(
              label: Text(
                'Prix promo',
              ),
            ),
            DataColumn(
              label: Text(
                'Type',
              ),
            ),
            DataColumn(
              label: Text(
                'Actions',
              ),
            ),
          ],
          source: ArticleDataSource(articles, () {
            Navigator.of(context).pushNamed("/add-related-product");
          }),
        ),
      ),
    );
  }
}
