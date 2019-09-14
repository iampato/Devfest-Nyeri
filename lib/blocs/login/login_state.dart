class LoginState {
  final bool isSuccess;
  final bool isFailure;
  final bool isLoading;

  LoginState({
    this.isSuccess,
    this.isFailure,
    this.isLoading
  });
   factory LoginState.intial() {
    return LoginState(
      isSuccess: false,
      isFailure: false,
      isLoading: false
    );
  }
  factory LoginState.loading() {
    return LoginState(
      isSuccess: false,
      isFailure: false,
      isLoading: true
    );
  }
  factory LoginState.failure() {
    return LoginState(
      isSuccess: false,
      isFailure: true,
      isLoading: false
    );
  }

  factory LoginState.success() {
    return LoginState(
      isSuccess: true,
      isFailure: false,
      isLoading: false
    );
  }

  @override
  String toString() {
    return '''LoginState {
      isSuccess: $isSuccess,
      isFailure: $isFailure,
      isLoading: $isLoading
    }''';
  }
}