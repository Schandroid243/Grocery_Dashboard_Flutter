import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/controller.dart';
import '../../../helper/constants.dart';
import '../../../models/user_model.dart';
import '../../../util/user_data_source.dart';

class ListUserTablet extends StatefulWidget {
  const ListUserTablet({super.key});

  @override
  State<ListUserTablet> createState() => _ListUserTabletState();
}

class _ListUserTabletState extends State<ListUserTablet> {
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
          builder: (userController) {
            if (userController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return SizedBox(
                height: 570,
                width: double.infinity,
                child: _buildUserList(userController.users),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildUserList(List<User> users) {
    return SingleChildScrollView(
      child: PaginatedDataTable(
        header: const Text('Clients'),
        rowsPerPage: 6,
        columns: const [
          DataColumn(
            label: Text(
              'Name',
            ),
          ),
          DataColumn(
            label: Text(
              'Email',
            ),
          ),
          DataColumn(
              label: Text(
            'Actions',
            textAlign: TextAlign.center,
          )),
        ],
        source: UserDataSource(users),
      ),
    );
  }
}
