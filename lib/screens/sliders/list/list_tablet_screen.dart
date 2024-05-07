import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/controller.dart';
import '../../../helper/constants.dart';
import '../../../models/slider_model.dart';
import '../../../util/slider_data_source.dart';

class ListSliderTablet extends StatefulWidget {
  const ListSliderTablet({super.key});

  @override
  State<ListSliderTablet> createState() => _ListSliderTabletState();
}

class _ListSliderTabletState extends State<ListSliderTablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      backgroundColor: myDefaultBackground,
      drawer: myDrawer,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetX<Controller>(
          init: Controller(),
          builder: (sliderController) {
            if (sliderController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return SizedBox(
                height: 570,
                width: double.infinity,
                child: _buildSliderList(sliderController.sliders),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: "Ajouter une publicité",
          backgroundColor: Colors.grey[900],
          child: const Icon(Icons.add, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pushNamed("/add-slider");
          }),
    );
  }

  Widget _buildSliderList(List<Sliders> sliders) {
    return SingleChildScrollView(
      child: PaginatedDataTable(
        header: const Text('Publicités'),
        rowsPerPage: 6,
        columns: const [
          DataColumn(label: Text('Image')),
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Actions')),
        ],
        source: SliderDataSource(sliders),
      ),
    );
  }
}
