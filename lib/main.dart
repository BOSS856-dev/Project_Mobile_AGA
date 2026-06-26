import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'bmi_screen.dart';
import 'riwayat_screen.dart';
import 'pengaturan_screen.dart';
import 'profil_screen.dart';

Map<String, String> akun = {"admin": "123"};

Map<String, String> userProfile = {
  "nama": "AGA",
  "email": "aga@email.com",
};

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/bmi': (context) => const BMIScreen(),
        '/riwayat': (context) => const RiwayatScreen(),
        '/pengaturan': (context) => const PengaturanScreen(),
        '/profil': (context) => const ProfilScreen(),
      },
    );
  }
}