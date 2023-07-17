import 'package:flutter/material.dart';

import '../../domain/entities/users/mock_users_model.dart';

class UsersWidget extends StatelessWidget {
  final MockUsersModel mockUsersModel;
  final VoidCallback ontap;
  final VoidCallback ontapaddress;
  final VoidCallback ontapcompany;
  const UsersWidget(
      {super.key,
      required this.mockUsersModel,
      required this.ontap,
      required this.ontapaddress,
      required this.ontapcompany});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Card(
          child: Column(
            children: [
              ListTile(
                onTap: ontap,
                trailing: Text(mockUsersModel.phone),
                leading: Text(mockUsersModel.id.toString()),
                title: Text(
                  mockUsersModel.name,
                  style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
                ),
                subtitle: Text(
                  mockUsersModel.email,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, fontWeight: FontWeight.w300),
                ),
              ),
              ElevatedButton(
                  onPressed: ontapaddress, child: const Text('Address')),
              ElevatedButton(
                  onPressed: ontapcompany, child: const Text('Company')),
            ],
          ),
        ));
  }
}
