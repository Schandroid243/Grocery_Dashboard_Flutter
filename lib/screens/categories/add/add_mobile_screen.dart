import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'dart:html' as html;
import '../../../config/config.dart';
import '../../../controller/controller.dart';
import '../../../helper/constants.dart';

class AddCategoryMobile extends StatefulWidget {
  const AddCategoryMobile({super.key});

  @override
  State<AddCategoryMobile> createState() => _AddCategoryMobileState();
}

class _AddCategoryMobileState extends State<AddCategoryMobile> {
  final TextEditingController _categoryNameController = TextEditingController();
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Ajouter une catégorie',
                style: TextStyle(fontSize: 20, color: Colors.grey[900]),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              style: const TextStyle(color: Colors.black),
              controller: _categoryNameController,
              cursorColor: Colors.grey[900]!,
              decoration: InputDecoration(
                labelText: 'Nom de la catégorie',
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
                _addCategory();
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

  void _addCategory() {
    final categoryName = _categoryNameController.text;
    if (categoryName.isNotEmpty && _image != null) {
      Get.find<Controller>().addCategory(categoryName, _image);
      //Show success message and navigate back
      FormHelper.showSimpleAlertDialog(
          context, Config.appName, "Catégorie ajoutée avec succès !", "Ok", () {
        Navigator.of(context).pop();
        Navigator.of(context)
            .pushNamedAndRemoveUntil("/list-category", (route) => false);
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
