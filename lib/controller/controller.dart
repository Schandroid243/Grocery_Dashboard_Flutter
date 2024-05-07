import 'package:get/get.dart';
import 'dart:html' as html;
import '../api/api_service.dart';
import '../models/article_model.dart';
import '../models/category_model.dart';
import '../models/slider_model.dart';
import '../models/user_model.dart';

class Controller extends GetxController {
  var categories = <Category>[].obs;
  var articles = <Articles>[].obs;
  var sliders = <Sliders>[].obs;
  var users = <User>[].obs;
  var isLoading = true.obs;
  Category? catForUse;
  Category? newCategory;
  Articles? newArticle;
  Articles? selectedArticleFromTheList;
  var selectedCategory =
      Category(categoryName: '', categoryImage: '', categoryId: '').obs;
  var selectedArticle = Articles(
          productName: '',
          category:
              Category(categoryName: '', categoryImage: '', categoryId: ''),
          productPrice: 0,
          productSalePrice: 0,
          productImage: '')
      .obs;

  @override
  void onInit() {
    fetchCategories();
    fetchArticles();
    fetchSliders();
    fetchUsers();
    super.onInit();
  }

  void getArticleForRelatedProduct(Articles article) {
    try {
      selectedArticleFromTheList = article;
      update();
    } catch (e) {
      print('Error $e occured while setting selected category');
    }
  }

  void fetchCategories() async {
    try {
      isLoading(true);
      var fetchedCategories = await APIService()
          .getCategories(1, 10); // Adjust parameters as needed
      if (fetchedCategories != null) {
        categories.assignAll(fetchedCategories);
      }
    } finally {
      isLoading(false);
    }
  }

  void addCategory(String categoryName, html.File? image) async {
    try {
      isLoading(true);
      var isAdded = await APIService().addCategory(categoryName, image);
      if (isAdded) {
        fetchCategories();
        update();
      }
    } finally {
      isLoading(false);
    }
  }

  void deleteCategory(String categoryId) async {
    try {
      isLoading(true);
      var deleteCategory = await APIService().deleteCategory(categoryId);
      if (deleteCategory) {
        fetchCategories();
        categories.removeWhere((category) => category.categoryId == categoryId);
        update();
      } else {}
    } finally {
      isLoading(false);
    }
  }

  void fetchArticles() async {
    try {
      isLoading(true);
      var fetchedArticles =
          await APIService().getArticles(1, 10); // Adjust parameters as needed
      if (fetchedArticles != null) {
        articles.assignAll(fetchedArticles);
      }
    } finally {
      isLoading(false);
    }
  }

  void setSelectedCategory(Category? category) {
    try {
      selectedCategory.value = category!;
      update();
    } catch (e) {
      print('Error occured while setting selected category');
    }
  }

  void setSelectedArticle(Articles? article) {
    try {
      selectedArticle.value = article!;
      update();
    } catch (e) {
      print('Error occured while setting selected article');
    }
  }

  void addRelatedProduct(String articleId, String relatedProductId) async {
    try {
      isLoading(true);
      var isAdded =
          await APIService().addRelatedProduct(articleId, relatedProductId);
      if (isAdded) {
        fetchArticles();
        update();
      }
    } finally {
      isLoading(false);
    }
  }

  void addArticle(Articles article, html.File? image) async {
    try {
      isLoading(true);
      var isAdded = await APIService().addArticle(article, image);
      if (isAdded) {
        fetchArticles();
        update();
      }
    } finally {
      isLoading(false);
    }
  }

  void deleteArticle(String productId) async {
    try {
      isLoading(true);
      var deleteArticle = await APIService().deleteArticles(productId);
      if (deleteArticle) {
        fetchArticles();
        articles.removeWhere((product) => product.productId == productId);
        update();
      } else {}
    } finally {
      isLoading(false);
    }
  }

  void fetchSliders() async {
    try {
      isLoading(true);
      var fetchedSliders =
          await APIService().getSliders(1, 10); // Adjust parameters as needed
      if (fetchedSliders != null) {
        sliders.assignAll(fetchedSliders);
      }
    } finally {
      isLoading(false);
    }
  }

  void addSlider(String sliderName, html.File? image) async {
    try {
      isLoading(true);
      var isAdded = await APIService().addSlider(sliderName, image);
      if (isAdded) {
        fetchSliders();
        update();
      }
    } finally {
      isLoading(false);
    }
  }

  void deleteSlider(String sliderId) async {
    try {
      isLoading(true);
      var deleteSlider = await APIService().deleteSlider(sliderId);
      if (deleteSlider) {
        fetchSliders();
        sliders.removeWhere((slider) => slider.sliderId == sliderId);
        update();
      } else {}
    } finally {
      isLoading(false);
    }
  }

  void fetchUsers() async {
    try {
      isLoading(true);
      var fetchedUsers =
          await APIService().getUsers(1, 10); // Adjust parameters as needed
      if (fetchedUsers != null) {
        users.assignAll(fetchedUsers);
      }
    } finally {
      isLoading(false);
    }
  }
}
