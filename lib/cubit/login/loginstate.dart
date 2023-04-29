part of 'logincubit.dart';


class LoginState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final String error;

  const LoginState({
    this.isLoading = false,
    this.isSuccess = false,

    this.error = '',
  });

  @override
  List<Object?> get props => [isLoading, isSuccess, error];

  LoginState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? error,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error ?? this.error,
    );
  }
  factory LoginState.initial() {
    return const LoginState(
      isLoading: false,
      isSuccess: false,
      error: '',
    );
  }

  factory LoginState.loading() {
    return const LoginState(
      isLoading: true,
      isSuccess: false,
      error: '',
    );
  }

  factory LoginState.success() {
    return const LoginState(
      isLoading: false,
      isSuccess: true,
      error: '',
    );
  }

  factory LoginState.failure(String error) {
    return LoginState(
      isLoading: false,
      isSuccess: false,
      error: error,
    );
  }

  factory LoginState.empty(String empty) {
    return LoginState(
      isLoading: false,
      isSuccess: false,
      error: empty,
    );
  }
}

