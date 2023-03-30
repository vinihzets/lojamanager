import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lojamanager/core/archiceture/bloc_builder.dart';
import 'package:lojamanager/core/archiceture/bloc_state.dart';
import 'package:lojamanager/features/home/presentation/bloc/home_bloc.dart';
import 'package:lojamanager/features/home/presentation/bloc/home_event.dart';

class ProductsTab extends StatelessWidget {
  HomeBloc bloc;
  ProductsTab({required this.bloc, super.key});

  @override
  Widget build(BuildContext context) {
    bloc.event.add(HomeEventGetCategories(context));

    return BlocScreenBuilder(
        stream: bloc.stateProducts,
        builder: (state) {
          if (state is BlocStableState) {
            final list = state.data;
            inspect(list);
            return SafeArea(child: ListView());
          } else if (state is BlocEmptyState) {
            return Container();
          } else {
            return SizedBox.shrink();
          }
        });
  }
}
