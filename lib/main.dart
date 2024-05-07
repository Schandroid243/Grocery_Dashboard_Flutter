import 'package:e_commerce_dashboard/responsive/relative_layout_list_articles.dart';
import 'package:e_commerce_dashboard/responsive/relative_layout_list_sliders.dart';
import 'package:e_commerce_dashboard/screens/articles/add/add_desktop_screen.dart';
import 'package:e_commerce_dashboard/screens/articles/add/add_tablet_screen.dart';
import 'package:e_commerce_dashboard/screens/articles/list/list_mobile_screen.dart';
import 'package:e_commerce_dashboard/screens/articles/list/list_tablet_screen.dart';
import 'package:e_commerce_dashboard/screens/sliders/add/add_desktop_screen.dart';
import 'package:e_commerce_dashboard/screens/sliders/list/list_desktop_screen.dart';
import 'package:e_commerce_dashboard/screens/sliders/list/list_mobile_screen.dart';
import 'package:e_commerce_dashboard/screens/sliders/list/list_tablet_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/controller.dart';
import 'responsive/relative_layout_add_article.dart';
import 'responsive/relative_layout_add_category.dart';
import 'responsive/relative_layout_add_related_product.dart';
import 'responsive/relative_layout_add_slider.dart';
import 'responsive/relative_layout_home.dart';
import 'responsive/relative_layout_list_category.dart';
import 'responsive/relative_layout_list_users.dart';
import 'screens/articles/add/add_mobile_screen.dart';
import 'screens/articles/list/list_desktop_screen.dart';
import 'screens/articles/related_products/add_related_products_desktop_screen.dart';
import 'screens/articles/related_products/add_related_products_mobile_screen.dart';
import 'screens/articles/related_products/add_related_products_tablet_screen.dart';
import 'screens/categories/add/add_desktop_screen.dart';
import 'screens/categories/add/add_mobile_screen.dart';
import 'screens/categories/add/add_tablet_screen.dart';
import 'screens/categories/list/list_desktop_screen.dart';
import 'screens/categories/list/list_mobile_screen.dart';
import 'screens/categories/list/list_tablet_screen.dart';
import 'screens/home/home_desktop_screen.dart';
import 'screens/home/home_mobile_screen.dart';
import 'screens/home/home_tablet_screen.dart';
import 'screens/sliders/add/add_mobile_screen.dart';
import 'screens/sliders/add/add_tablet_screen.dart';
import 'screens/users/list/list_desktop_screen.dart';
import 'screens/users/list/list_mobile_screen.dart';
import 'screens/users/list/list_tablet_screen.dart';

void main() {
  Get.put(Controller());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-commerce Dashboard',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      routes: <String, WidgetBuilder>{
        '/': (context) => const ResponsiveLayoutHome(
              mobileScaffold: HomeMobile(),
              tabletScaffold: HomeTablet(),
              desktopScaffold: HomeDeskTop(),
            ),
        '/list-category': (context) => const ResponsiveLayoutListCategory(
              mobileScaffold: ListCategoryMobile(),
              tabletScaffold: ListCategoryTablet(),
              desktopScaffold: ListCategoryDeskTop(),
            ),
        '/list-article': (context) => const ResponsiveLayoutListArticles(
              mobileScaffold: ListArticleMobile(),
              tabletScaffold: ListArticleTablet(),
              desktopScaffold: ListArticleDeskTop(),
            ),
        '/list-user': (context) => const ResponsiveLayoutListUser(
              mobileScaffold: ListUserMobile(),
              tabletScaffold: ListUserTablet(),
              desktopScaffold: ListUserDeskTop(),
            ),
        '/list-slider': (context) => const ResponsiveLayoutListSliders(
              mobileScaffold: ListSliderMobile(),
              tabletScaffold: ListSliderTablet(),
              desktopScaffold: ListSliderDeskTop(),
            ),
        '/add-category': (context) => const ResponsiveLayoutAddCategory(
              mobileScaffold: AddCategoryMobile(),
              tabletScaffold: AddCategoryTablet(),
              desktopScaffold: AddCategoryDeskTop(),
            ),
        '/add-slider': (context) => const ResponsiveLayoutAddSlider(
              mobileScaffold: AddSliderMobile(),
              tabletScaffold: AddSliderTablet(),
              desktopScaffold: AddSliderDeskTop(),
            ),
        '/add-article': (context) => const ResponsiveLayoutAddArticle(
              mobileScaffold: AddArticleMobile(),
              tabletScaffold: AddArticleTablet(),
              desktopScaffold: AddArticleDeskTop(),
            ),
        '/add-related-product': (context) =>
            const ResponsiveLayoutAddRelatedProduct(
              mobileScaffold: AddRelatedProductMobile(),
              tabletScaffold: AddRelatedProductTablet(),
              desktopScaffold: AddRelatedProductDeskTop(),
            ),
      },
    );
  }
}
