import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../../../config/config.dart';
import '../../../controller/controller.dart';
import '../../../helper/constants.dart';
import '../../../models/article_model.dart';

class ShowDetailMobile extends StatefulWidget {
  const ShowDetailMobile({super.key});

  @override
  State<ShowDetailMobile> createState() => _ShowDetailMobileState();
}

class _ShowDetailMobileState extends State<ShowDetailMobile> {
  final Controller articleController = Get.find<Controller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      backgroundColor: myDefaultBackground,
      drawer: myDrawer,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Nom: ${articleController.selectedArticleFromTheList!.productName}',
                  style: TextStyle(fontSize: 20, color: Colors.grey[900]),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Categorie: ${articleController.selectedArticleFromTheList!.category.categoryName}',
                  style: TextStyle(fontSize: 20, color: Colors.grey[900]),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Description: ${articleController.selectedArticleFromTheList!.productShortDescription}',
                  style: TextStyle(fontSize: 20, color: Colors.grey[900]),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Prix: ${articleController.selectedArticleFromTheList!.productPrice}',
                  style: TextStyle(fontSize: 20, color: Colors.grey[900]),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Prix de vente: ${articleController.selectedArticleFromTheList!.productSalePrice}',
                  style: TextStyle(fontSize: 20, color: Colors.grey[900]),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Lot: ${articleController.selectedArticleFromTheList!.productSKU}',
                  style: TextStyle(fontSize: 20, color: Colors.grey[900]),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Type: ${articleController.selectedArticleFromTheList!.productType}',
                  style: TextStyle(fontSize: 20, color: Colors.grey[900]),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Stock: ${articleController.selectedArticleFromTheList!.stockStatus}',
                  style: TextStyle(fontSize: 20, color: Colors.grey[900]),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _addRelatedProduct() {
    final relatedProduct = articleController.selectedArticle.value;
    if (relatedProduct.productId != null &&
        articleController.selectedArticleFromTheList!.productId !=
            relatedProduct.productId &&
        articleController.selectedArticleFromTheList!.productId != null) {
      Get.find<Controller>().addRelatedProduct(
          articleController.selectedArticleFromTheList!.productId!,
          relatedProduct.productId!);
      //Show success message and navigate back
      FormHelper.showSimpleAlertDialog(context, Config.appName,
          "Article connexe ajoutée avec succès !", "Ok", () {
        Navigator.of(context).pop();
        Navigator.of(context)
            .pushNamedAndRemoveUntil("/list-article", (route) => false);
      });
    } else {
      //Show error message
      FormHelper.showSimpleAlertDialog(
          context,
          Config.appName,
          "Un problème de connexion est survenue veuillez réessayer !",
          "Ok", () {
        Navigator.of(context).pop();
      });
    }
  }
}
