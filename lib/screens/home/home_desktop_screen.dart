import 'package:flutter/material.dart';

import '../../helper/constants.dart';
import '../../util/box.dart';

class HomeDeskTop extends StatefulWidget {
  const HomeDeskTop({super.key});

  @override
  State<HomeDeskTop> createState() => _HomeDeskTopState();
}

class _HomeDeskTopState extends State<HomeDeskTop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar,
        backgroundColor: myDefaultBackground,
        body: Row(
          children: [
            //open drawer
            myDrawer,

            //Rest of the body
            Expanded(
              child: SingleChildScrollView(
                // Wrap with SingleChildScrollView
                child: Column(
                  children: [
                    // 4 boxes on the top
                    AspectRatio(
                      aspectRatio: 4,
                      child: SizedBox(
                        width: double.infinity,
                        child: GridView.builder(
                            shrinkWrap: true, // Add shrinkWrap property
                            physics:
                                const NeverScrollableScrollPhysics(), // Disable scrolling
                            itemCount: 4,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4),
                            itemBuilder: ((context, index) {
                              return Box(index);
                            })),
                      ),
                    ),

                    // Here should add some graphs
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
