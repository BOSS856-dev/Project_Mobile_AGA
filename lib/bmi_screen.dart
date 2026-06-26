import 'package:flutter/material.dart';
import 'hasil_screen.dart';
import 'ui_helper.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final berat = TextEditingController();
  final tinggi = TextEditingController();

  bool isRemember = false;
  String gender = "Pria";
  List<String> aktivitas = [];

  void hitung() {
    double b = double.tryParse(berat.text) ?? 0;
    double t = (double.tryParse(tinggi.text) ?? 0) / 100;

    if (t == 0) return;

    double bmi = b / (t * t);

    String kategori;
    if (bmi < 18.5) {
      kategori = "Kurus";
    } else if (bmi < 25) {
      kategori = "Normal";
    } else if (bmi < 30) {
      kategori = "Gemuk";
    } else {
      kategori = "Obesitas";
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => HasilScreen(
          bmi: bmi,
          kategori: kategori,
        ),
      ),
    );
  }

  void showInfoSheet() {
    showModalBottomSheet(
      context: context,
      builder: (_) => Container(
        padding: const EdgeInsets.all(20),
        height: 200,
        child: const Center(
          child: Text(
            "BMI adalah pengukuran berat badan ideal.",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
  
Widget _buildMenuItem({
  required IconData icon,
  required String title,
  required VoidCallback onTap,
  Color? color,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Card(
      child: ListTile(
        leading: Icon(icon, color: color ?? Colors.blue),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: color ?? Colors.black,
          ),
        ),
        onTap: onTap,
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(

        // DRAWER
        drawer: Drawer(
          child: Column(
            children: [

              // HEADER
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 60, bottom: 20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.purple],
                  ),
                ),
                child: const Column(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      child: Icon(Icons.person, size: 40),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "AGA",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "AGA Develover",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: ListView(
                  children: [

                    _buildMenuItem(
                      icon: Icons.home,
                      title: "Beranda",
                      onTap: () => Navigator.pushNamed(context, '/bmi'),
                    ),

                    _buildMenuItem(
                      icon: Icons.history,
                      title: "Riwayat",
                      onTap: () => Navigator.pushNamed(context, '/riwayat'),
                    ),

                    _buildMenuItem(
                      icon: Icons.person,
                      title: "Profil",
                      onTap: () => Navigator.pushNamed(context, '/profil'),
                    ),

                    _buildMenuItem(
                      icon: Icons.settings,
                      title: "Pengaturan",
                      onTap: () =>
                          Navigator.pushNamed(context, '/pengaturan'),
                    ),

                    _buildMenuItem(
                      icon: Icons.info,
                      title: "About",
                      onTap: () {},
                    ),

                    const Divider(),

                    _buildMenuItem(
                      icon: Icons.logout,
                      title: "Keluar",
                      color: Colors.red,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        appBar: AppBar(
          title: const Text("BMI"),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: "Hitung"),
              Tab(text: "Info"),
            ],
          ),
        ),

        body: TabBarView(
          children: [

            // TAB HITUNG
            Container(
              decoration: gradientBg,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Beranda",
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, '/profil'),
                          child: const CircleAvatar(
                            backgroundColor: Colors.white24,
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    TextField(
                      controller: tinggi,
                      decoration: const InputDecoration(
                        labelText: "Tinggi",
                      ),
                    ),

                    TextField(
                      controller: berat,
                      decoration: const InputDecoration(
                        labelText: "Berat",
                      ),
                    ),

                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Checkbox(
                          value: isRemember,
                          onChanged: (value) {
                            setState(() {
                              isRemember = value!;
                            });
                          },
                        ),
                        const Text(
                          "Simpan data",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),

                    RadioListTile(
                      title: const Text(
                        "Pria",
                        style: TextStyle(color: Colors.white),
                      ),
                      value: "Pria",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),

                    RadioListTile(
                      title: const Text(
                        "Wanita",
                        style: TextStyle(color: Colors.white),
                      ),
                      value: "Wanita",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),

                    Wrap(
                      spacing: 10,
                      children: ["Olahraga", "Kerja", "Santai"].map((item) {
                        return FilterChip(
                          label: Text(item),
                          selected: aktivitas.contains(item),
                          onSelected: (value) {
                            setState(() {
                              if (value) {
                                aktivitas.add(item);
                              } else {
                                aktivitas.remove(item);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 20),

                    customButton("Hitung BMI", hitung),

                    const Spacer(),

                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          const Column(
                            children: [
                              Icon(Icons.home, color: Colors.white),
                              Text(
                                "Beranda",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),

                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/riwayat'),
                            child: const Column(
                              children: [
                                Icon(Icons.history, color: Colors.white),
                                Text(
                                  "Riwayat",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),

                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/pengaturan'),
                            child: const Column(
                              children: [
                                Icon(Icons.settings, color: Colors.white),
                                Text(
                                  "Pengaturan",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // TAB INFO
            Container(
              decoration: gradientBg,
              child: const Center(
                child: Text(
                  "Informasi BMI",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: showInfoSheet,
          child: const Icon(Icons.info),
        ),
      ),
    );
  }
}