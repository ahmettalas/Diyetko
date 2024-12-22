import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC1FF72),
        title: const Text(
          "Ayarlar",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildSettingsOption(
              "Profil Ayarları",
              Icons.person,
              onTap: () {
                // Profil Ayarları
              },
            ),
            _buildSettingsOption(
              "Uygulama Teması",
              Icons.color_lens,
              onTap: () {
                // Uygulama Teması
              },
            ),
            _buildSettingsOption(
              "Bildirim Ayarları",
              Icons.notifications,
              onTap: () {
                // Bildirim Ayarları
              },
            ),
            _buildSettingsOption(
              "Çıkış Yap",
              Icons.exit_to_app,
              onTap: () {
                // Çıkış Yap
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsOption(String title, IconData icon, {required Function() onTap}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}