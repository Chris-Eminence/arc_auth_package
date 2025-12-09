import 'package:arc_auth_sdk/arc_auth_sdk.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  //
  // // Stream that tells you if user is logged in or not
  // Stream<AuthState> get authStateChanges {
  //   return _firebaseAuth.authStateChanges().map((user) {
  //     if (user != null) {
  //       return AuthState(AuthStatus.authenticated, user);
  //     }
  //     return AuthState(AuthStatus.unauthenticated);
  //   });
  // }
  //
  // // Get current user
  // User? get currentUser => _firebaseAuth.currentUser;
  //
  //
  // // EMAIL/PASSWORD SIGN IN
  // Future<User> signInWithEmail(String email, String password) async {
  //   try {
  //     final credential = await _firebaseAuth.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     return credential.user!;
  //   } on FirebaseAuthException catch (e) {
  //     throw _handleFirebaseError(e);
  //   }
  // }
  //
  // // GOOGLE SIGN IN
  // Future<User> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //     if (googleUser == null) throw Exception('Google sign in aborted');
  //
  //     final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //
  //     final userCredential = await _firebaseAuth.signInWithCredential(credential);
  //     return userCredential.user!;
  //   } catch (e) {
  //     throw NetworkException();
  //   }
  // }
  //
  // // APPLE SIGN IN
  // Future<void> signInWithApple() async {
  //   // try {
  //   //   final appleCredential = await SignInWithApple.getAppleIDCredential(
  //   //     scopes: [
  //   //       AppleIDAuthorizationScopes.email,
  //   //       AppleIDAuthorizationScopes.fullName,
  //   //     ],
  //   //   );
  //   //
  //   //   final oauthCredential = OAuthProvider("apple.com").credential(
  //   //     idToken: appleCredential.identityToken,
  //   //     accessToken: appleCredential.authorizationCode,
  //   //   );
  //   //
  //   //   final userCredential = await _firebaseAuth.signInWithCredential(oauthCredential);
  //   //   return userCredential.user!;
  //   // } catch (e) {
  //   //   throw NetworkException();
  //   // }
  //
  // }
  //
  // // FACEBOOK SIGN IN (Placeholder: Implementation required)
  // Future<User> signInWithFacebook() async {
  //   // You would typically use flutter_facebook_auth package here
  //   throw AuthException('Facebook authentication not implemented', 'not-implemented');
  // }
  //
  // // SIGN OUT
  // Future<void> signOut() async {
  //   await Future.wait([
  //     _firebaseAuth.signOut(),
  //     _googleSignIn.signOut(),
  //   ]);
  // }
  //
  // // Convert Firebase errors to our custom errors
  // AuthException _handleFirebaseError(FirebaseAuthException e) {
  //   switch (e.code) {
  //     case 'user-not-found':
  //       return UserNotFoundException();
  //     case 'wrong-password':
  //       return InvalidCredentialsException();
  //     case 'email-already-in-use':
  //       return EmailAlreadyInUseException();
  //     case 'weak-password':
  //       return WeakPasswordException();
  //     case 'network-request-failed':
  //       return NetworkException();
  //     default:
  //       return AuthException(e.message ?? 'An error occurred', e.code);
  //   }
  // }
}