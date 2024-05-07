import 'dart:convert';
import 'dart:typed_data';
import 'dart:html' as html;
import 'package:e_commerce_dashboard/models/user_model.dart';
import 'package:http/http.dart' as http;

import '../config/config.dart';
import '../models/article_model.dart';
import '../models/category_model.dart';
import '../models/related_article_model.dart';
import '../models/slider_model.dart';

class APIService {
  static var client = http.Client();

  Future<List<Category>?> getCategories(int page, int pageSize) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    Map<String, String> queryString = {
      'page': page.toString(),
      'pageSize': pageSize.toString(),
    };

    var baseUrl = "${Config.apiUrl}/${Config.categoryAPI}";
    var uri = Uri.parse(baseUrl).replace(queryParameters: queryString);

    var response = await client.get(uri, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      //print("The response from the api is: ${response.body}");

      return categoriesFromJson(data["data"]);
    } else {
      //print("The response from the api is: ${response.body}");
      return null;
    }
  }

  Future<bool> deleteCategory(String categoryId) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var baseUrl = "${Config.apiUrl}/${Config.categoryAPI}/$categoryId";
    var uri = Uri.parse(baseUrl);

    var response = await client.delete(uri, headers: requestHeaders);

    if (response.statusCode == 200) {
      print("The response from the api is: ${response.body}");
      return true;
    } else {
      print("The response from the api is: ${response.body}");
      return false;
    }
  }

  Future<bool> addCategory(String categoryName, html.File? image) async {
    var baseUrl = "${Config.apiUrl}/${Config.categoryAPI}";
    var uri = Uri.parse(baseUrl);

    //Read the file bytes asynchronously
    final reader = html.FileReader();
    reader.readAsArrayBuffer(image!);
    //Wait fo the reader to read the file
    await reader.onLoad.first;

    //Convert the file to Uint8List
    Uint8List imageBytes = reader.result as Uint8List;

    // create multipart request
    var request = http.MultipartRequest('POST', uri);
    // Add category name as a plain text field
    request.fields['categoryName'] = categoryName;

    // Add category image as a file field
    var imageFile = http.MultipartFile.fromBytes(
      'categoryImage',
      imageBytes,
      filename: 'category_image.jpg',
    );
    request.files.add(imageFile);
    // Send the request
    try {
      // Send the request
      var response = await request.send();

      // Read response
      var responseBody = await response.stream.bytesToString();
      var jsonResponse = jsonDecode(responseBody);
      print('Status code is: ${response.statusCode}');
      if (response.statusCode == 201) {
        print("The json response is: $jsonResponse");
        return true;
      } else {
        //print("The json response is: $jsonResponse");
        return false;
      }
    } catch (e) {
      print("Error occurred: $e");
      return false;
    }
  }

  Future<List<Articles>?> getArticles(int page, int pageSize) async {
    // Implement GET request for articles
    // Use similar structure as getCategories method
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    Map<String, String> queryString = {
      'page': page.toString(),
      'pageSize': pageSize.toString(),
    };

    var baseUrl = "${Config.apiUrl}/${Config.productAPI}";
    var uri = Uri.parse(baseUrl).replace(queryParameters: queryString);

    var response = await client.get(uri, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      //print("The response from the api is: ${response.body}");

      return productsFromJson(data["data"]);
    } else {
      //print("The response from the api is: ${response.body}");
      return null;
    }
  }

  Future<bool> deleteArticles(String articleId) async {
    // Implement DELETE request for deleting a user
    // Use similar structure as deleteCategory method
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var baseUrl = "${Config.apiUrl}/${Config.productAPI}/$articleId";
    var uri = Uri.parse(baseUrl);

    var response = await client.delete(uri, headers: requestHeaders);

    if (response.statusCode == 200) {
      print("The response from the api is: ${response.body}");
      return true;
    } else {
      print("The response from the api is: ${response.body}");
      return false;
    }
  }

  Future<bool> addArticle(Articles article, html.File? image) async {
    try {
      // Read the file bytes asynchronously
      final reader = html.FileReader();
      reader.readAsArrayBuffer(image!);
      // Wait for the reader to read the file
      await reader.onLoad.first;

      // Convert the file to Uint8List
      Uint8List imageBytes = reader.result as Uint8List;

      // Create multipart request
      var request = http.MultipartRequest(
          'POST', Uri.parse('${Config.apiUrl}/${Config.productAPI}'));

      // Add article data as fields
      request.fields['productName'] = article.productName;
      request.fields['productShortDescription'] =
          article.productShortDescription ?? '';
      request.fields['productPrice'] = article.productPrice.toString();
      request.fields['productSalePrice'] = article.productSalePrice.toString();
      request.fields['productSKU'] = article.productSKU ?? '';
      request.fields['productType'] = article.productType ?? '';
      request.fields['stockStatus'] = article.stockStatus ?? '';
      request.fields['relatedProducts'] = article.relatedProducts?.join(',') ??
          ''; // Convert list to comma-separated string

      // Convert category object to JSON string
      //String categoryJson = jsonEncode(article.category.toJson());

      // Add category as a field
      //request.fields['category'] = categoryJson;
      request.fields['category'] = article.category.categoryId;

      // Add image file
      var imageFile = http.MultipartFile.fromBytes(
        'productImage',
        imageBytes,
        filename: 'article_image.jpg',
      );
      request.files.add(imageFile);

      print('Here is the request: $request');
      // Send the request
      var response = await request.send();

      // Check response status code
      if (response.statusCode == 201) {
        // Success
        return true;
      } else {
        // Failure
        print('Error: ${response.reasonPhrase}');
        return false;
      }
    } catch (e) {
      // Exception occurred
      print('Error: $e');
      return false;
    }
  }

  Future<List<Sliders>?> getSliders(int page, int pageSize) async {
    // Implement GET request for sliders
    // Use similar structure as getCategories method
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    Map<String, String> queryString = {
      'page': page.toString(),
      'pageSize': pageSize.toString(),
    };

    var baseUrl = "${Config.apiUrl}/${Config.sliderAPI}";
    var uri = Uri.parse(baseUrl).replace(queryParameters: queryString);

    var response = await client.get(uri, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      //print("The response from the api is: ${response.body}");

      return slidersFromJson(data["data"]);
    } else {
      //print("The response from the api is: ${response.body}");
      return null;
    }
  }

  Future<bool> addSlider(String sliderName, html.File? image) async {
    var baseUrl = "${Config.apiUrl}/${Config.sliderAPI}";
    var uri = Uri.parse(baseUrl);

    //Read the file bytes asynchronously
    final reader = html.FileReader();
    reader.readAsArrayBuffer(image!);
    //Wait fo the reader to read the file
    await reader.onLoad.first;

    //Convert the file to Uint8List
    Uint8List imageBytes = reader.result as Uint8List;

    // create multipart request
    var request = http.MultipartRequest('POST', uri);
    // Add category name as a plain text field
    request.fields['sliderName'] = sliderName;

    // Add category image as a file field
    var imageFile = http.MultipartFile.fromBytes(
      'sliderImage',
      imageBytes,
      filename: 'slider_image.jpg',
    );
    request.files.add(imageFile);
    // Send the request
    try {
      // Send the request
      var response = await request.send();

      // Read response
      var responseBody = await response.stream.bytesToString();
      var jsonResponse = jsonDecode(responseBody);
      print('Status code is: ${response.statusCode}');
      if (response.statusCode == 201) {
        print("The json response is: $jsonResponse");
        return true;
      } else {
        //print("The json response is: $jsonResponse");
        return false;
      }
    } catch (e) {
      print("Error occurred: $e");
      return false;
    }
  }

  Future<bool> deleteSlider(String sliderId) async {
    // Implement DELETE request for deleting a user
    // Use similar structure as deleteCategory method
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var baseUrl = "${Config.apiUrl}/${Config.sliderAPI}/$sliderId";
    var uri = Uri.parse(baseUrl);

    var response = await client.delete(uri, headers: requestHeaders);

    if (response.statusCode == 200) {
      print("The response from the api is: ${response.body}");
      return true;
    } else {
      print("The response from the api is: ${response.body}");
      return false;
    }
  }

  Future<List<RelatedProduct>?> getRelatedProducts(String productId) async {
    // Implement GET request for related products
    // Use similar structure as getCategories method
  }

  Future<bool> addRelatedProduct(
      String articleId, String relatedProductId) async {
    var baseUrl = "${Config.apiUrl}/${Config.relatedProductAPI}";
    var uri = Uri.parse(baseUrl);

    // Create JSON data to send in the request body
    var jsonData = {
      'product': articleId,
      'relatedProduct': relatedProductId,
    };

    // Encode JSON data
    var jsonDataEncoded = json.encode(jsonData);

    // Send POST request with JSON data
    var response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonDataEncoded,
    );

    // Check response status and return accordingly
    if (response.statusCode == 200) {
      print("The json response is: ${response.body}");
      return true;
    } else {
      print(
          "Failed to add related product. Status code: ${response.statusCode}");
      return false;
    }
  }

  Future<List<User>?> getUsers(int page, int pageSize) async {
    // Implement GET request for articles
    // Use similar structure as getCategories method
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    Map<String, String> queryString = {
      'page': page.toString(),
      'pageSize': pageSize.toString(),
    };

    var baseUrl = "${Config.apiUrl}/${Config.userAPI}";
    var uri = Uri.parse(baseUrl).replace(queryParameters: queryString);

    var response = await client.get(uri, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      //print("The response from the api for user is: ${response.body}");

      return usersFromJson(data["data"]);
    } else {
      //print("The response from the api is: ${response.body}");
      return null;
    }
  }
}
