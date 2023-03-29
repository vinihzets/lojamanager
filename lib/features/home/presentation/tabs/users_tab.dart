import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lojamanager/core/archiceture/bloc_builder.dart';
import 'package:lojamanager/core/archiceture/bloc_state.dart';
import 'package:lojamanager/features/home/domain/entities/users_entity.dart';
import 'package:lojamanager/features/home/presentation/bloc/home_bloc.dart';
import 'package:lojamanager/features/home/presentation/bloc/home_event.dart';
import 'package:lojamanager/features/home/presentation/widgets/user_tile.dart';

class UsersTab extends StatefulWidget {
  HomeBloc bloc;

  UsersTab({required this.bloc, super.key});

  @override
  State<UsersTab> createState() => _UsersTabState();
}

class _UsersTabState extends State<UsersTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.bloc.event.add(HomeEventGetUsers(context));

    return

        //  Column(
        //   children: [
        //     const Padding(
        //       padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 4.0),
        //       child: TextField(
        //         decoration: InputDecoration(
        //             hintText: 'Pesquisar',
        //             hintStyle: TextStyle(color: Colors.white),
        //             icon: Icon(Icons.search),
        //             border: InputBorder.none),
        //       ),
        //     ),
        BlocScreenBuilder(
            stream: widget.bloc.state,
            builder: (state) {
              if (state is BlocStableState) {
                final List<UsersEntity> list = state.data;

                return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: list.map((e) => UserTile(users: e)).toList(),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: 1,
                );
              } else if (state is BlocEmptyState) {
                return Container();
              } else {
                return SizedBox.shrink();
              }
            });
    // ],
    // );
  }
}
