import 'dart:typed_data';

import 'package:e_commerce_dashboard/models/article_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'dart:html' as html;
import '../../../config/config.dart';
import '../../../controller/controller.dart';
import '../../../helper/constants.dart';
import '../../../models/category_model.dart';

class AddArticleTablet extends StatefulWidget {
  const AddArticleTablet({super.key});

  @override
  State<AddArticleTablet> createState() => _AddArticleTabletState();
}

class _AddArticleTabletState extends State<AddArticleTablet> {
  final Controller articleController = Get.find<Controller>();
  final TextEditingController _articleNameController = TextEditingController();
  final TextEditingController _articleShortDescriptionController =
      TextEditingController();
  final TextEditingController _articlePriceController = TextEditingController();
  final TextEditingController _articleSalePriceController =
      TextEditingController();
  final TextEditingController _articleSKUController = TextEditingController();
  final TextEditingController _articleTypeController = TextEditingController();
  final TextEditingController _articleStockStatusController =
      TextEditingController();
  html.File? _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      backgroundColor: myDefaultBackground,
      drawer: myDrawer,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 80,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Ajouter un article',
                style: TextStyle(fontSize: 20, color: Colors.grey[900]),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              style: const TextStyle(color: Colors.black),
              controller: _articleNameController,
              cursorColor: Colors.grey[900]!,
              decoration: InputDecoration(
                labelText: 'Nom de l\'article',
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
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              style: const TextStyle(color: Colors.black),
              controller: _articleShortDescriptionController,
              cursorColor: Colors.grey[900]!,
              decoration: InputDecoration(
                labelText: 'Petite description',
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
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              style: const TextStyle(color: Colors.black),
              controller: _articlePriceController,
              cursorColor: Colors.grey[900]!,
              decoration: InputDecoration(
                labelText: 'Prix',
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
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              style: const TextStyle(color: Colors.black),
              controller: _articleSalePriceController,
              cursorColor: Colors.grey[900]!,
              decoration: InputDecoration(
                labelText: 'Prix de vente',
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
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              style: const TextStyle(color: Colors.black),
              controller: _articleSKUController,
              cursorColor: Colors.grey[900]!,
              decoration: InputDecoration(
                labelText: 'Référence de l\'article',
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
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              style: const TextStyle(color: Colors.black),
              controller: _articleTypeController,
              cursorColor: Colors.grey[900]!,
              decoration: InputDecoration(
                labelText: 'Type',
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
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              style: const TextStyle(color: Colors.black),
              controller: _articleStockStatusController,
              cursorColor: Colors.grey[900]!,
              decoration: InputDecoration(
                labelText: 'Etat de stock',
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
            ),
            const SizedBox(
              height: 10,
            ),
            DropdownButtonFormField<Category>(
              decoration: InputDecoration(
                labelText: 'Sélectionner une categorie',
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
              value: articleController.selectedCategory.value,
              items: Get.find<Controller>().categories.map((category) {
                return DropdownMenuItem<Category>(
                  value: category,
                  child: Text(category.categoryName),
                );
              }).toList(),
              onChanged: (value) {
                // Update selected category
                Get.find<Controller>().setSelectedCategory(value!);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                _pickImage();
              },
              style: ButtonStyle(
                // Customize the text color
                textStyle: MaterialStateProperty.all<TextStyle>(
                  const TextStyle(
                    color: Colors.blue, // Change the text color here
                  ),
                ),
                // Customize the click effect color
                overlayColor: MaterialStateProperty.all<Color>(
                  Colors.grey[900]!
                      .withOpacity(0.1), // Change the click effect color here
                ),
              ),
              child: Text('Sélectionner une image',
                  style: TextStyle(color: Colors.grey[900])),
            ),
            const SizedBox(
              height: 20,
            ),
            _image != null
                ? FutureBuilder<Uint8List?>(
                    future: _readFileAsBytes(_image!),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData) {
                        return Image.memory(
                          snapshot.data as Uint8List,
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        );
                      } else if (snapshot.hasError) {
                        return const Text('Something went wrong');
                      } else {
                        return const CircularProgressIndicator();
                      }
                    })
                : Container(),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                _addArticle();
              },
              child: const Text('Enregistrer',
                  style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }

  Future<Uint8List?> _readFileAsBytes(html.File file) async {
    final reader = html.FileReader();
    reader.readAsArrayBuffer(file);
    await reader.onLoad.first;
    return reader.result as Uint8List?;
  }

  void _pickImage() {
    var input = html.FileUploadInputElement()..accept = 'image/*';
    input.click();
    input.onChange.listen((event) {
      final fileList = input.files;
      if (fileList != null && fileList.length == 1) {
        setState(() {
          _image = fileList[0];
        });
      }
    });
  }

  void _addArticle() {
    final articleName = _articleNameController.text;
    final articleShortDescription = _articleShortDescriptionController.text;
    final articlePrice = _articlePriceController.text;
    final articleSalePrice = _articleSalePriceController.text;
    final articleSKU = _articleSKUController.text;
    final articleType = _articleTypeController.text;
    final articleStockStatus = _articleStockStatusController.text;
    final category = articleController.selectedCategory.value;
    if (articleName.isNotEmpty &&
        articleStockStatus.isNotEmpty &&
        articleType.isNotEmpty &&
        articleSKU.isNotEmpty &&
        articleSalePrice.isNotEmpty &&
        articlePrice.isNotEmpty &&
        articleShortDescription.isNotEmpty &&
        _image != null) {
      var article = Articles(
        productName: articleName,
        category: category,
        productPrice: double.parse(articlePrice),
        productSalePrice: double.parse(articleSalePrice),
        productSKU: articleSKU,
        productShortDescription: articleShortDescription,
        productType: articleType,
        stockStatus: articleStockStatus,
        productImage: '',
      );
      Get.find<Controller>().addArticle(article, _image);
      //Show success message and navigate back
      FormHelper.showSimpleAlertDialog(
          context, Config.appName, "Article ajoutée avec succès !", "Ok", () {
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
