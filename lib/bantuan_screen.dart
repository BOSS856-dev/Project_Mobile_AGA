import 'package:flutter/material.dart';

class BantuanScreen extends StatelessWidget {
  const BantuanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bantuan")),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Text("Panduan penggunaan aplikasi BMI"),
      ),
    );
  }
}