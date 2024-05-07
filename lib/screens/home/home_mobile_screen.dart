import 'package:flutter/material.dart';

import '../../helper/constants.dart';
import '../../util/box.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({super.key});

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar,
        backgroundColor: myDefaultBackground,
        drawer: myDrawer,
        body: SingleChildScrollView(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: SizedBox(
                  width: double.infinity,
                  child: GridView.builder(
                      shrinkWrap: true, // Add shrinkWrap property
                      physics:
                          const NeverScrollableScrollPhysics(), // Disable scrolling
                      itemCount: 4,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: ((context, index) {
                        return Box(index);
                      })),
                ),
              ),

              // Here should add some graphs
            ],
          ),
        ));
  }
}
