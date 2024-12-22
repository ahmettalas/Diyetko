import 'package:flutter/material.dart';

// Profil ekranı için tasarlanan widget
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC1FF72), // AppBar'ın arka plan rengi
        title: const Text(
          "Profilim", // Başlık
          style: TextStyle(color: Colors.black), // Başlık metni rengi
        ),
        centerTitle: true, // Başlığı ortalar
        iconTheme: const IconThemeData(color: Colors.black), // Geri düğmesi rengi
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Ekran kenarlarından boşluk bırakır
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Elemanları sola yaslar
          children: [
            const Text(
              "Kullanıcı Bilgileri", // Bölüm başlığı
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Yazı stili
            ),
            const SizedBox(height: 10), // Başlık ile form alanları arasında boşluk
            _buildProfileField("Ad", "Kullanıcı Adı"), // Ad bilgisi
            _buildProfileField("E-posta", "kullanici@mail.com"), // E-posta bilgisi
            _buildProfileField("Hedef", "Kilo Verme"), // Kullanıcının hedef bilgisi
            const SizedBox(height: 20), // Bilgiler ile buton arasında boşluk
            ElevatedButton(
              onPressed: () {
                // Bilgileri düzenlemek için işlev buraya eklenebilir
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Butonun arka plan rengi
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Yuvarlatılmış kenarlar
                ),
              ),
              child: const Text(
                "Bilgileri Düzenle", // Buton metni
                style: TextStyle(color: Colors.white, fontSize: 16), // Yazı stili
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Profil bilgilerini görüntülemek için bir widget
  Widget _buildProfileField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Elemanları sola yaslar
      children: [
        Text(
          label, // Bilgi etiketi
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // Etiket stili
        ),
        const SizedBox(height: 5), // Etiket ile değer arasında boşluk
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12), // İç kenar boşlukları
          width: double.infinity, // Genişlik olarak ekranın tamamını kaplar
          decoration: BoxDecoration(
            color: Colors.white, // Arka plan rengi
            border: Border.all(color: Colors.grey), // Çerçeve rengi
            borderRadius: BorderRadius.circular(10), // Yuvarlatılmış köşeler
          ),
          child: Text(
            value, // Bilginin değeri
            style: const TextStyle(fontSize: 14), // Yazı stili
          ),
        ),
        const SizedBox(height: 15), // Alanlar arasında boşluk
      ],
    );
  }
}