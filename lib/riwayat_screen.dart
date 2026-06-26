import 'package:flutter/material.dart';
import 'ui_helper.dart';

class RiwayatScreen extends StatefulWidget {
  const RiwayatScreen({super.key});

  @override
  State<RiwayatScreen> createState() => _RiwayatScreenState();
}

class _RiwayatScreenState extends State<RiwayatScreen> {
  List<Map<String, String>> riwayat = [
    {"tanggal": "01-01-2026", "bmi": "22.5", "kategori": "Normal"},
    {"tanggal": "02-01-2026", "bmi": "27.1", "kategori": "Gemuk"},
    {"tanggal": "03-01-2026", "bmi": "18.0", "kategori": "Kurus"},
  ];

  void hapusData(int index) {
    setState(() {
      riwayat.removeAt(index);
    });
  }

  void hapusSemua() {
    setState(() {
      riwayat.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riwayat BMI"),
        centerTitle: true,
      ),

      body: Container(
        decoration: gradientBg,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: riwayat.isEmpty
                    ? const Center(
                        child: Text("Belum ada data",
                            style: TextStyle(color: Colors.white)),
                      )
                    : ListView.builder(
                        itemCount: riwayat.length,
                        itemBuilder: (context, index) {
                          final data = riwayat[index];

                          return customCard(
                            child: ListTile(
                              title: Text(
                                "BMI: ${data["bmi"]}",
                                style: const TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                "Kategori: ${data["kategori"]}\nTanggal: ${data["tanggal"]}",
                                style: const TextStyle(color: Colors.white70),
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete,
                                    color: Colors.red),
                                onPressed: () => hapusData(index),
                              ),
                            ),
                          );
                        },
                      ),
              ),

              customButton("Kembali ke Beranda", () {
                Navigator.pushNamed(context, '/bmi');
              }),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: hapusSemua,
        child: const Icon(Icons.delete_sweep),
      ),
    );
  }
}