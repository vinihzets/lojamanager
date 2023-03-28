abstract class BlocState<T> {
  T? data;

  BlocState(this.data);
}

class BlocStableState extends BlocState {
  BlocStableState(super.data);
}

class BlocEmptyState extends BlocState {
  BlocEmptyState(super.data);
}

class BlocErrorState extends BlocState {
  final String error;

  BlocErrorState(this.error, super.data);
}

class BlocIdleState extends BlocState {
  BlocIdleState(super.data);
}
