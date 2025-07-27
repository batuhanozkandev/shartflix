class AuthState {
  final bool isLoading;
  final bool isPasswordObscured;
  final String? errorMessage;

  AuthState({
    this.isLoading = false,
    this.isPasswordObscured = true,
    this.errorMessage,
  });

  AuthState copyWith({
    bool? isLoading,
    bool? isPasswordObscured,
    String? errorMessage,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
      errorMessage: errorMessage,
    );
  }
}