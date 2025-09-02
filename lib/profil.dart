import 'package:flutter/material.dart';
import 'profil_data.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedAvatar = 0; // 0: person, 1: face, 2: star
late TextEditingController namaController = 
    TextEditingController(text: profileNotifier.value.nama);

late TextEditingController noHpController = 
    TextEditingController(text: profileNotifier.value.noHp);

late TextEditingController emailController = 
    TextEditingController(text: profileNotifier.value.email);

@override
void initState() {
  super.initState();
  selectedAvatar = profileNotifier.value.avatar ?? 0;
}

  void _saveProfile() {
    profileNotifier.value = ProfileData(
      nama: namaController.text,
      noHp: noHpController.text,
      email: emailController.text,
      avatar: selectedAvatar,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profil berhasil disimpan!')),
    );
  }

  @override
  void dispose() {
    namaController.dispose();
    noHpController.dispose();
    emailController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Edit Profil",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Pilih Avatar
            const Text("Pilih Avatar", style: TextStyle(fontSize: 16)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _avatarOption(0, Icons.person),
                const SizedBox(width: 16),
                _avatarOption(1, Icons.face),
                const SizedBox(width: 16),
                _avatarOption(2, Icons.star),
              ],
            ),
            const SizedBox(height: 24),
            // Form Nama
            TextField(
              controller: namaController,
              decoration: const InputDecoration(labelText: "Nama"),
            ),
            const SizedBox(height: 12),
            // Form No HP
            TextField(
              controller: noHpController,
              decoration: const InputDecoration(labelText: "No. Handphone"),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 12),
            // Form Email
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _saveProfile,
              child: const Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _avatarOption(int value, IconData icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAvatar = value;
        });
      },
      child: CircleAvatar(
        radius: 30,
        backgroundColor: selectedAvatar == value ? Colors.orange : Colors.grey[300],
        child: Icon(icon, size: 35, color: Colors.black),
      ),
    );
  }
}