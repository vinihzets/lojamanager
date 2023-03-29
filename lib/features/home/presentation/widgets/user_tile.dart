import 'package:flutter/material.dart';
import 'package:lojamanager/features/home/domain/entities/users_entity.dart';

class UserTile extends StatelessWidget {
  final UsersEntity users;
  const UserTile({required this.users, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        users.email,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
