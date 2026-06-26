import 'package:flutter/material.dart';
import 'ui_helper.dart';

class HasilScreen extends StatelessWidget {
  final double bmi;
  final String kategori;

  const HasilScreen({super.key, required this.bmi, required this.kategori});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: gradientBg,
        child: Center(
          child: customCard(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("BMI: ${bmi.toStringAsFixed(2)}"),
                Text("Kategori: $kategori"),
                customButton("Kembali", () => Navigator.pop(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}