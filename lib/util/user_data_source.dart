import 'package:flutter/material.dart';

import '../models/user_model.dart';

class UserDataSource extends DataTableSource {
  final List<User> _user;

  UserDataSource(this._user);

  @override
  DataRow? getRow(int index) {
    if (index >= _user.length) {
      return null;
    }
    final user = _user[index];
    return DataRow(cells: [
      DataCell(Text(user.fullName)),
      DataCell(Text(user.email)),
      DataCell(Row(
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Trigger action to edit the category
              // You can implement the edit functionality here
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              // Trigger action to delete the category
              // You can implement the delete functionality here
            },
          ),
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _user.length;

  @override
  int get selectedRowCount => 0;
}
