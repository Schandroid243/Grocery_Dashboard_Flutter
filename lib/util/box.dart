import 'package:e_commerce_dashboard/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Box extends StatefulWidget {
  const Box(this.index, {super.key});
  final int index;

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  @override
  Widget build(BuildContext context) {
    return Container(child: _boxFeeds());
  }

  Widget _boxFeeds() {
    List<String> titles = ["Categories", "Products", "Users", "Payments"];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetX<Controller>(
        init: Controller(),
        builder: (myController) {
          //Will add the number of payments later on
          List<int> dataCounts = [
            myController.categories.length,
            myController.articles.length,
            myController.users.length,
            6
          ];
          if (myController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[200]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        titles[widget.index],
                        style: const TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "${dataCounts[widget.index]}",
                        style: const TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ]),
              ),
            );
          }
        },
      ),
    );
  }
}
