import 'package:chat_app/providers/auth_provider.dart';
import 'package:chat_app/screens/splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(MyApp(
    prefs: prefs,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
    required this.prefs,
  }) : super(key: key);

  final SharedPreferences prefs;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(
            firebaseFirestore: firebaseFirestore,
            prefs: prefs,
            googleSignIn: GoogleSignIn(),
            firebaseAuth: FirebaseAuth.instance,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Chat App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (ctx) => const SplashScreen(),
        },
      ),
    );
  }
}
