// Custom error messages that are easy to understand
class AuthException implements Exception {
  final String message;
  final String code;

  AuthException(this.message, this.code);
}

class InvalidCredentialsException extends AuthException {
  InvalidCredentialsException() : super('Wrong email or password', 'invalid-credentials');
}

class UserNotFoundException extends AuthException {
  UserNotFoundException() : super('No account found with this email', 'user-not-found');
}

class EmailAlreadyInUseException extends AuthException {
  EmailAlreadyInUseException() : super('This email is already registered', 'email-in-use');
}

class WeakPasswordException extends AuthException {
  WeakPasswordException() : super('Password is too weak', 'weak-password');
}

class TokenExpiredException extends AuthException {
  TokenExpiredException() : super('Your session has expired', 'token-expired');
}

class NetworkException extends AuthException {
  NetworkException() : super('No internet connection', 'network-error');
}