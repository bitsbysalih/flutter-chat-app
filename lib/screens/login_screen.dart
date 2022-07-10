import 'package:chat_app/providers/auth_provider.dart';
import 'package:chat_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    switch (authProvider.status) {
      case Status.authenticateError:
        Fluttertoast.showToast(msg: 'Sign in failed');
        break;
      case Status.authenticateCanceled:
        Fluttertoast.showToast(msg: 'Sign in cancelled');
        break;
      case Status.authenticated:
        Fluttertoast.showToast(msg: 'Sign in successful');
        break;
      default:
        break;
    }

    return Scaffold(
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 30,
            ),
            children: [
              const Text(
                'Welcome to Smart Talk',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Login to continue',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  bool isSuccess = await authProvider.handleGoogleSignIn();
                  if (isSuccess) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  }
                },
                child: Text('Login with google'),
              ),
            ],
          ),
          Center(
            child: authProvider.status == Status.authenticating
                ? const CircularProgressIndicator()
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
