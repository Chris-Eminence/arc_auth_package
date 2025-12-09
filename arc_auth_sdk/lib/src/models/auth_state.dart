// Three possible states: logged in, logged out, or token expired
enum AuthStatus {
  authenticated,    // User is logged in
  unauthenticated, // User is logged out
  tokenExpired     // Login expired, need to login again
}

class AuthState {
  final AuthStatus status;
  final dynamic user;  // Firebase user object

  AuthState(this.status, [this.user]);
}