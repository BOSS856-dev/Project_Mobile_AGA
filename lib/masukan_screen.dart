import 'package:flutter/material.dart';

class MasukanScreen extends StatelessWidget {
  const MasukanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Masukan")),
      body: const Center(child: Text("Form Masukan")),
    );
  }
}