import 'package:flutter/widgets.dart';
import 'package:lojamanager/core/archiceture/bloc_event.dart';
import 'package:lojamanager/features/register/domain/entities/register_entity.dart';
import 'package:lojamanager/features/register/presentation/bloc/register_bloc.dart';

abstract class RegisterBlocEvent {}

class RegisterTryEvent implements RegisterBlocEvent {
  RegisterEntity entity;
  BuildContext context;

  RegisterTryEvent(this.context, this.entity);
}
