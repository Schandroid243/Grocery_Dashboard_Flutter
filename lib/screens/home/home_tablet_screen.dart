import 'package:flutter/material.dart';

import '../../helper/constants.dart';
import '../../util/box.dart';

class HomeTablet extends StatefulWidget {
  const HomeTablet({super.key});

  @override
  State<HomeTablet> createState() => _HomeTabletState();
}

class _HomeTabletState extends State<HomeTablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      backgroundColor: myDefaultBackground,
      drawer: myDrawer,
      body: SingleChildScrollView(
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
    );
  }
}
