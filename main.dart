import 'package:flutter/material.dart';
import 'package:whatasppp/chatscreen.dart';
import 'homescreen.dart';
import 'registration_screen.dart';
import 'login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MaterialApp(
    title: 'Named Routes',
    initialRoute: 'Welcome_screen',
    routes: {
      'Welcome_screen': (context) => const HomeScreen(),
      'Registration_screen': (context) => const RegistrationScreen(),
      'Login_screen': (context) => const LoginScreen(),
      'Chat_screen': (context) => const ChatScreen()
    },
  ));
}
