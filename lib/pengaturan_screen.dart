import 'package:flutter/material.dart';
import 'ui_helper.dart';

class PengaturanScreen extends StatefulWidget {
  const PengaturanScreen({super.key});

  @override
  State<PengaturanScreen> createState() => _PengaturanScreenState();
}

class _PengaturanScreenState extends State<PengaturanScreen> {
  bool isDarkMode = false;
  String selectedBahasa = "Indonesia";

  List<String> bahasaList = ["Indonesia", "English"];

  
  void saveSetting() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Pengaturan berhasil disimpan"),
        backgroundColor: Colors.green,
      ),
    );
  }

    Widget anggotaCard(int no, String nama, String jabatan, String foto) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage(foto),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$no. $nama",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  jabatan,
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          const Icon(Icons.verified, color: Colors.lightGreenAccent),
        ],
      ),
    );
  }

  void showProfilKelompok() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: const LinearGradient(
                colors: [Color(0xFF2C2C54), Color(0xFF40407A)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "👥 Profil Kelompok",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),

                anggotaCard(1, "Andre Putra", "Ketua", "assets/images/fotokami.jpeg"),
                const SizedBox(height: 10),
                anggotaCard(2, "Gilang Reynabil", "Anggota", "assets/images/fotokami.jpeg"),
                const SizedBox(height: 10),
                anggotaCard(3, "Abdy Prayoga", "Anggota", "assets/images/fotokami.jpeg"),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Tutup"),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  
  void confirmLogout() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Keluar"),
        content: const Text("Yakin ingin keluar?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // aksi logout
            },
            child: const Text("Keluar"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pengaturan")),

      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(radius: 30),
                  SizedBox(height: 10),
                  Text("Andre Putra", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Beranda"),
              onTap: () => Navigator.pushNamed(context, '/bmi'),
            ),

            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Keluar"),
              onTap: confirmLogout,
            ),
          ],
        ),
      ),

      body: Container(
        decoration: gradientBg,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SwitchListTile(
              value: isDarkMode,
              onChanged: (v) => setState(() => isDarkMode = v),
              title: const Text("Dark Mode"),
            ),

            const SizedBox(height: 10),

            DropdownButton<String>(
              value: selectedBahasa,
              isExpanded: true,
              items: bahasaList.map((e) {
                return DropdownMenuItem(value: e, child: Text(e));
              }).toList(),
              onChanged: (v) => setState(() => selectedBahasa = v!),
            ),

            const SizedBox(height: 20),

            ListTile(
              leading: const Icon(Icons.group),
              title: const Text("Profil Kelompok"),
              onTap: showProfilKelompok,
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: saveSetting,
        child: const Icon(Icons.save),
      ),
    );
  }
}