import 'package:flutter/material.dart';
import 'main.dart';
import 'ui_helper.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  bool isEdit = false;

  late TextEditingController nama;
  late TextEditingController email;

  @override
  void initState() {
    super.initState();
    nama = TextEditingController(text: userProfile["nama"]);
    email = TextEditingController(text: userProfile["email"]);
  }

  void simpan() {
    setState(() {
      userProfile["nama"] = nama.text;
      userProfile["email"] = email.text;
      isEdit = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profil berhasil diperbarui")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: gradientBg,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [              
              const SizedBox(height: 40),

              //HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Profil",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  IconButton(
                    icon: Icon(
                      isEdit ? Icons.close : Icons.edit,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() => isEdit = !isEdit);
                    },
                  )
                ],
              ),

              const SizedBox(height: 20),

              //AVATAR
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white24,
                child: Icon(Icons.person, size: 40, color: Colors.white),
              ),

              const SizedBox(height: 20),
              

              // CARD PROFIL
              customCard(
                child: Column(
                  children: [

                    // NAMA
                    isEdit
                        ? TextField(
                            controller: nama,
                            decoration:
                                const InputDecoration(labelText: "Nama"),
                          )
                        : ListTile(
                            title: const Text("Nama",
                                style: TextStyle(color: Colors.white70)),
                            subtitle: Text(userProfile["nama"] ?? "",
                                style: const TextStyle(color: Colors.white)),
                          ),

                    // EMAIL
                    isEdit
                        ? TextField(
                            controller: email,
                            decoration:
                                const InputDecoration(labelText: "Email"),
                          )
                        : ListTile(
                            title: const Text("Email",
                                style: TextStyle(color: Colors.white70)),
                            subtitle: Text(userProfile["email"] ?? "",
                                style: const TextStyle(color: Colors.white)),
                          ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // BUTTON SIMPAN
              if (isEdit)
                customButton("Simpan", simpan),
                 const SizedBox(height: 20),

                customButton("Kembali ke Beranda", () {
                 Navigator.pushNamed(context, '/bmi');
                }),

              const SizedBox(height: 60),

              // LOGOUT
              customButton("Logout", () {
                Navigator.popUntil(context, (route) => route.isFirst);
              }),
            ],
          ),
        ),
      ),
    );
  }
}