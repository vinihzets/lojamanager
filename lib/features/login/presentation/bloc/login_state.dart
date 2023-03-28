abstract class LoginState<T> {
  T? data;

  LoginState(this.data);
}

class LoginIdle<T> extends LoginState {
  LoginIdle(super.data);
}

class LoginLoading extends LoginState {
  LoginLoading(super.data);
}

class LoginSucess extends LoginState {
  LoginSucess(super.data);
}

class LoginFailure extends LoginState {
  LoginFailure(super.data);
}
