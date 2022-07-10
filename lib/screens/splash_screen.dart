import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Screen imports
import 'package:chat_app/screens/home_screen.dart';
import 'package:chat_app/screens/login_screen.dart';

//Provider imports
import 'package:chat_app/providers/auth_provider.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash-screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void checkSignedIn() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    bool isLoggedIn = await authProvider.isLoggedIn();

    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (ctx) => const HomeScreen(),
        ),
      );
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (ctx) => const LoginScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      checkSignedIn();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: const [
            Text(
              "Welcome to Smart Talk",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Smartest Chat Application",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
