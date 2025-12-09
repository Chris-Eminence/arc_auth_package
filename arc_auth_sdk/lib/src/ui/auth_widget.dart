import 'package:flutter/material.dart';
import '../exceptions/auth_exceptions.dart';
import '../services/auth_services.dart';

class AuthWidget extends StatefulWidget {
  // Boolean flags control which UI components are shown
  final bool enableEmailPassword;
  final bool enableGoogle;
  final bool enableApple;
  final bool enableFacebook;

  const AuthWidget({
    super.key,
    this.enableEmailPassword = true,
    this.enableGoogle = false,
    this.enableApple = false,
    this.enableFacebook = false,
  });

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  // Service managed internally
  late final AuthService _authService;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    // Initialize the service instance
    _authService = AuthService();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signInWithEmail() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // await _authService.signInWithEmail(
      //   _emailController.text.trim(),
      //   _passwordController.text,
      // );
      _showSuccessMessage('Email and Password Authentication Successful!');
    } on AuthException catch (e) {
      setState(() {
        _errorMessage = e.message;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showSuccessMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Show error message if any
              if (_errorMessage != null)
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.red.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(_errorMessage!, style: TextStyle(color: Colors.red.shade900)),
                ),


              // 1. Email/Password fields
              if (widget.enableEmailPassword) ...[

                // Todo: Redesign email and password here
                // Todo: widget make every parameter optional

                const Text(
                  'You are now at **Email and Password Authentication**',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _isLoading ? null : _signInWithEmail,
                  child: _isLoading
                      ? const CircularProgressIndicator()
                      : const Text('Sign In with Email'),
                ),
                const SizedBox(height: 30),
              ],

              // 2. Google Sign In button
              if (widget.enableGoogle) ...[

                // Todo: Redesign Google auth widget here
                // Todo: widget make every parameter optional

                const Text(
                  'You are now at **Google Authentication**',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: _isLoading ? null : () async {
                    setState(() => _isLoading = true);
                    try {
                      // await _authService.signInWithGoogle();
                      _showSuccessMessage('Google Authentication Successful!');
                    } catch (e) {
                      setState(() => _errorMessage = 'Google sign in failed');
                    } finally {
                      setState(() => _isLoading = false);
                    }
                  },
                  icon: const Icon(Icons.login),
                  label: const Text('Sign In with Google'),
                ),
                const SizedBox(height: 30),
              ],

              // 3. Apple Sign In button
              if (widget.enableApple) ...[

                // Todo: Redesign email and password here
                // Todo: widget make every parameter optional

                const Text(
                  'You are now at **Apple Authentication**',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: _isLoading ? null : () async {
                    setState(() => _isLoading = true);
                    try {
                      // await _authService.signInWithApple();
                      _showSuccessMessage('Apple Authentication Successful!');
                    } catch (e) {
                      setState(() => _errorMessage = 'Apple sign in failed');
                    } finally {
                      setState(() => _isLoading = false);
                    }
                  },
                  icon: const Icon(Icons.apple),
                  label: const Text('Sign In with Apple'),
                ),
                const SizedBox(height: 30),
              ],

              // 4. Facebook Sign In button
              if (widget.enableFacebook) ...[

                // Todo: Redesign Facebook authentication here
                // Todo: widget make every parameter optional

                const Text(
                  'You are now at **Facebook Authentication**',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: _isLoading ? null : () async {
                    setState(() => _isLoading = true);
                    try {
                      // await _authService.signInWithFacebook();
                      _showSuccessMessage('Facebook Authentication Successful!');
                    } on AuthException catch (e) {
                      setState(() => _errorMessage = e.message);
                    } catch (e) {
                      setState(() => _errorMessage = 'Facebook sign in failed');
                    } finally {
                      setState(() => _isLoading = false);
                    }
                  },
                  icon: const Icon(Icons.facebook),
                  label: const Text('Sign In with Facebook'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}


// Todo: On every widget - be sure to make sure that every parameter is reassignable.
// Todo: The social logins should display horizontally or vertically depending on the user's choice