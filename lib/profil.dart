import 'package:flutter/material.dart';
import 'profil_data.dart';


<<<<<<< HEAD
class MyProfileApp extends StatelessWidget {
  const MyProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Profil Saya',
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
=======
class ProfilePage extends StatefulWidget {
>>>>>>> 7a37cc06ecba2772c331f9ece57d169504198900
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
<<<<<<< HEAD
                const Text(
                  "Foto",
                  style: TextStyle(fontSize: 16),
                ),
                const Spacer(),

                // Efek 3D pada Foto Profil
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 8,
                        offset: const Offset(2, 4),
                      ),
                    ],
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.orange,
                    child: Icon(
                      Icons.person,
                      size: 35,
                      color: Colors.black,
                    ),
                  ),
                ),

                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward_ios, size: 16),
=======
                _avatarOption(0, Icons.person),
                const SizedBox(width: 16),
                _avatarOption(1, Icons.face),
                const SizedBox(width: 16),
                _avatarOption(2, Icons.star),
>>>>>>> 7a37cc06ecba2772c331f9ece57d169504198900
              ],
            ),
            const SizedBox(height: 24),
            // Form Nama
            TextField(
              controller: namaController,
              decoration: const InputDecoration(labelText: "Nama"),
            ),
<<<<<<< HEAD
            child: const Column(
              children: [
                ListTile(
                  title: Text(
                    "Nama",
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: Text(
                    "Contoh Nama User",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Divider(height: 1),
                ListTile(
                  title: Text(
                    "No. Handphone",
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "085********967",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.arrow_forward_ios, size: 16),
                    ],
                  ),
                ),
                Divider(height: 1),
                ListTile(
                  title: Text(
                    "Email",
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "contohemailyainiy....",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.arrow_forward_ios, size: 16),
                    ],
                  ),
                ),
              ],
=======
            const SizedBox(height: 12),
            // Form No HP
            TextField(
              controller: noHpController,
              decoration: const InputDecoration(labelText: "No. Handphone"),
              keyboardType: TextInputType.phone,
>>>>>>> 7a37cc06ecba2772c331f9ece57d169504198900
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