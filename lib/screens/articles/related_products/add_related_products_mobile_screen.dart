import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../../../config/config.dart';
import '../../../controller/controller.dart';
import '../../../helper/constants.dart';
import '../../../models/article_model.dart';

class AddRelatedProductMobile extends StatefulWidget {
  const AddRelatedProductMobile({super.key});

  @override
  State<AddRelatedProductMobile> createState() =>
      _AddRelatedProductMobileState();
}

class _AddRelatedProductMobileState extends State<AddRelatedProductMobile> {
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
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'L\'article parent est: ${articleController.selectedArticleFromTheList!.productName}',
                  style: TextStyle(fontSize: 20, color: Colors.grey[900]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField<Articles>(
                decoration: InputDecoration(
                  labelText: 'Sélectionner un produit connexes',
                  labelStyle: const TextStyle(color: Colors.black),
                  fillColor: Colors.grey[400],
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.grey), // Change border color here
                    borderRadius: BorderRadius.circular(
                        8.0), // Adjust border radius as needed
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors
                            .grey[900]!), // Change focused border color here
                    borderRadius: BorderRadius.circular(
                        8.0), // Adjust border radius as needed
                  ),
                ),
                value: Get.find<Controller>().newArticle,
                items: Get.find<Controller>().articles.map((article) {
                  return DropdownMenuItem<Articles>(
                    value: article,
                    child: Text(article.productName),
                  );
                }).toList(),
                onChanged: (value) {
                  // Update selected category
                  Get.find<Controller>().setSelectedArticle(value);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  _addRelatedProduct();
                },
                child: const Text('Enregistrer',
                    style: TextStyle(color: Colors.white)),
              )
            ],
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
